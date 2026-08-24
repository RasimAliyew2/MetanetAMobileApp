using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels;

public partial class LocationMapViewModel : BaseViewModel
{
    private readonly LocationCatalogService _catalog;

    public ObservableCollection<MapPointItem> Points { get; } = new();

    [ObservableProperty]
    private double centerLatitude = 40.4093;   // Bakı üçün nümunə

    [ObservableProperty]
    private double centerLongitude = 49.8671;

    [ObservableProperty]
    private double startRadiusKm = 1;

    [ObservableProperty]
    private string mapTitle = "Məkan";

    public LocationMapViewModel(
        BottomMenuState bottomMenu,
        LocationCatalogService catalog) : base(bottomMenu)
    {
        _catalog = catalog;
    }

    public void SelectLocation(string locationId)
    {
        var location = _catalog.GetLocation(locationId);
        if (location is null)
            return;

        Points.Clear();
        Points.Add(location);

        CenterLatitude = location.Latitude;
        CenterLongitude = location.Longitude;
        MapTitle = location.Title;
    }

    [RelayCommand]
    public async Task GoBack()
    {
        await Shell.Current.GoToAsync("..");
    }
}
