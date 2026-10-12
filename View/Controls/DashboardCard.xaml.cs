using System.Windows.Input;

namespace MetanetA_MobileApp.View.Controls;

public partial class DashboardCard : ContentView
{
    public static readonly BindableProperty TitleProperty =
        BindableProperty.Create(nameof(Title), typeof(string), typeof(DashboardCard), string.Empty);
    public static readonly BindableProperty SubtitleProperty =
        BindableProperty.Create(nameof(Subtitle), typeof(string), typeof(DashboardCard), string.Empty);
    public static readonly BindableProperty ArtworkProperty =
        BindableProperty.Create(nameof(Artwork), typeof(string), typeof(DashboardCard), string.Empty);
    public static readonly BindableProperty CommandProperty =
        BindableProperty.Create(nameof(Command), typeof(ICommand), typeof(DashboardCard));

    public string Title
    {
        get => (string)GetValue(TitleProperty);
        set => SetValue(TitleProperty, value);
    }
    public string Subtitle
    {
        get => (string)GetValue(SubtitleProperty);
        set => SetValue(SubtitleProperty, value);
    }
    public string Artwork
    {
        get => (string)GetValue(ArtworkProperty);
        set => SetValue(ArtworkProperty, value);
    }
    public ICommand? Command
    {
        get => (ICommand?)GetValue(CommandProperty);
        set => SetValue(CommandProperty, value);
    }
    public DashboardCard() => InitializeComponent();
}
