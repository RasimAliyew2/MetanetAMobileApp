using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;

namespace MetanetA_MobileApp.View.Map;

public partial class LocationFoldersPage : ContentPage
{
    public LocationFoldersPage(LocationCatalogService catalog)
    {
        InitializeComponent();
        FoldersList.ItemsSource = catalog.Folders;
    }

    private async void OnFolderSelected(object? sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.FirstOrDefault() is not LocationFolderItem folder)
            return;

        FoldersList.SelectedItem = null;

        await Shell.Current.GoToAsync(
            $"{nameof(LocationListPage)}?folderId={Uri.EscapeDataString(folder.Id)}");
    }

    private async void OnBackClicked(object? sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("..");
    }
}
