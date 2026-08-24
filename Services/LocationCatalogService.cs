using MetanetA_MobileApp.Model;

namespace MetanetA_MobileApp.Services;

public sealed class LocationCatalogService
{
    private readonly IReadOnlyList<LocationFolderItem> _folders;

    public LocationCatalogService()
    {
        var rokolLocations = new List<MapPointItem>
        {
            new()
            {
                Id = "ilham-qala",
                Latitude = 40.449083,
                Longitude = 49.8920,
                Title = "İlham Qala",
                ShortInfo = "Metro və ətraf zona",
                Description = "(Rüstəmov İlham Əlməmməd oğlu)(MİQ)"
            },
            new()
            {
                Id = "fuad-qafarli",
                Latitude = 40.427565,
                Longitude = 49.889082,
                Title = "Fuad Qafarlı A.",
                ShortInfo = "Mərkəzi hissə",
                Description = "Fuad Qafarlı A.(Zabrat)(MİQ)"
            },
            new()
            {
                Id = "ezizov-sovqat",
                Latitude = 40.4400086763817,
                Longitude = 49.74052193871677,
                Title = "Əzizov Sovqat",
                ShortInfo = string.Empty,
                Description = "Hökuməli (MİQ)"
            }
        };

        _folders = new List<LocationFolderItem>
        {
            new()
            {
                Id = "rokol-renglendirme-masinlari",
                Title = "Rokol rəngləndirmə maşınları olan mağazalar",
                Locations = rokolLocations
            },
            new()
            {
                Id = "diger-magazalar",
                Title = "Diger magazalar",
                Locations = Array.Empty<MapPointItem>()
            }
        };
    }

    public IReadOnlyList<LocationFolderItem> Folders => _folders;

    public LocationFolderItem? GetFolder(string folderId) =>
        _folders.FirstOrDefault(folder => folder.Id == folderId);

    public MapPointItem? GetLocation(string locationId) =>
        _folders
            .SelectMany(folder => folder.Locations)
            .FirstOrDefault(location => location.Id == locationId);
}
