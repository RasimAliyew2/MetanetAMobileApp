namespace MetanetA_MobileApp.Model;

public class LocationFolderItem
{
    public string Id { get; init; } = string.Empty;
    public string Title { get; init; } = string.Empty;
    public IReadOnlyList<MapPointItem> Locations { get; init; } = Array.Empty<MapPointItem>();

    public string LocationCountText => $"{Locations.Count} məkan";
}
