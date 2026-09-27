using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;

namespace MetanetA_MobileApp.View.Map;

public partial class LocationListPage : ContentPage, IQueryAttributable
{
    private readonly LocationCatalogService _catalog;

    public LocationListPage(LocationCatalogService catalog)
    {
        InitializeComponent();
        _catalog = catalog;
    }

    public void ApplyQueryAttributes(IDictionary<string, object> query)
    {
        if (!query.TryGetValue("folderId", out var value))
        {
            ShowEmptyFolder();
            return;
        }

        var encodedFolderId = value?.ToString() ?? string.Empty;
        var folderId = Uri.UnescapeDataString(encodedFolderId);
        var folder = _catalog.GetFolder(folderId);

        if (folder is null)
        {
            ShowEmptyFolder();
            return;
        }

        FolderTitleLabel.Text = folder.Title;
        LocationsList.ItemsSource = folder.Locations;

        var hasLocations = folder.Locations.Count > 0;
        EmptyState.IsVisible = !hasLocations;
        LocationsList.IsVisible = hasLocations;
    }

    private void ShowEmptyFolder()
    {
        FolderTitleLabel.Text = string.Empty;
        LocationsList.ItemsSource = null;
        LocationsList.IsVisible = false;
        EmptyState.IsVisible = true;
    }

    private async void OnLocationSelected(object? sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.FirstOrDefault() is not MapPointItem location)
            return;

        LocationsList.SelectedItem = null;

        await Shell.Current.GoToAsync(
            $"{nameof(LocationMapPage)}?locationId={Uri.EscapeDataString(location.Id)}");
    }

    private async void OnBackClicked(object? sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("..");
    }
}
