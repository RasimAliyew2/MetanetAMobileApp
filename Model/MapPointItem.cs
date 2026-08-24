namespace MetanetA_MobileApp.Model;

public class MapPointItem
{
    public string Id { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public string ShortInfo { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;

    public double Latitude { get; set; }
    public double Longitude { get; set; }
}
