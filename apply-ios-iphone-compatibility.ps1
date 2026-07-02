param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

function Write-Step($message) {
    Write-Host "[iOS patch] $message"
}

$root = Get-Location
$csproj = Join-Path $root "MetanetA_MobileApp.csproj"
$infoPlist = Join-Path $root "Platforms/iOS/Info.plist"
$entitlements = Join-Path $root "Platforms/iOS/Entitlements.plist"
$qrScanner = Join-Path $root "View/QrScannerPage.xaml.cs"
$mauiProgram = Join-Path $root "MauiProgram.cs"

if (-not (Test-Path $csproj)) {
    throw "MetanetA_MobileApp.csproj tapılmadı. Skripti repo-nun əsas app qovluğunda işlət: MetanetA_MobileApp/MetanetA_MobileApp"
}

Write-Step "Repo yoxlanıldı: $root"

# 1) csproj düzəlişləri
$csprojText = Get-Content $csproj -Raw -Encoding UTF8

$csprojText = $csprojText -replace 'net9\.0-windows10\.0\.19041\.0', 'net8.0-windows10.0.19041.0'

if ($csprojText -notmatch '<CodesignEntitlements>Platforms/iOS/Entitlements\.plist</CodesignEntitlements>') {
    $iosPropertyGroup = @'

  <PropertyGroup Condition="$([MSBuild]::GetTargetPlatformIdentifier('$(TargetFramework)')) == 'ios'">
    <CodesignEntitlements>Platforms/iOS/Entitlements.plist</CodesignEntitlements>
    <MtouchLink>SdkOnly</MtouchLink>
  </PropertyGroup>
'@
    $csprojText = $csprojText -replace '</Project>', "$iosPropertyGroup`r`n</Project>"
}

Set-Content $csproj -Value $csprojText -Encoding UTF8
Write-Step "MetanetA_MobileApp.csproj yeniləndi"

# 2) iOS Info.plist
$infoDir = Split-Path $infoPlist -Parent
if (-not (Test-Path $infoDir)) {
    New-Item -ItemType Directory -Path $infoDir | Out-Null
}

$infoPlistContent = @'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>LSRequiresIPhoneOS</key>
    <true/>

    <key>UIDeviceFamily</key>
    <array>
        <integer>1</integer>
        <integer>2</integer>
    </array>

    <key>UIRequiredDeviceCapabilities</key>
    <array>
        <string>arm64</string>
    </array>

    <key>UISupportedInterfaceOrientations</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
    </array>

    <key>UISupportedInterfaceOrientations~ipad</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationPortraitUpsideDown</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>

    <key>XSAppIconAssets</key>
    <string>Assets.xcassets/appicon.appiconset</string>

    <key>NSCameraUsageDescription</key>
    <string>QR kodu skan etmək üçün kamera icazəsi lazımdır.</string>

    <key>NSLocationWhenInUseUsageDescription</key>
    <string>Xəritədə yaxın məntəqələri göstərmək üçün məkan icazəsi lazımdır.</string>

    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSExceptionDomains</key>
        <dict>
            <key>webrequests.matanata.com</key>
            <dict>
                <key>NSExceptionAllowsInsecureHTTPLoads</key>
                <true/>
                <key>NSIncludesSubdomains</key>
                <true/>
            </dict>
        </dict>
    </dict>
</dict>
</plist>
'@
Set-Content $infoPlist -Value $infoPlistContent -Encoding UTF8
Write-Step "Platforms/iOS/Info.plist yeniləndi"

# 3) iOS Entitlements.plist
$entitlementsContent = @'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
</dict>
</plist>
'@
Set-Content $entitlements -Value $entitlementsContent -Encoding UTF8
Write-Step "Platforms/iOS/Entitlements.plist yaradıldı/yeniləndi"

# 4) QrScannerPage.xaml.cs
if (Test-Path $qrScanner) {
    $qrScannerContent = @'
using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;

public partial class QrScannerPage : ContentPage
{
    public QrScannerPage(QrScannerViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }

    protected override bool OnBackButtonPressed()
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            if (BindingContext is QrScannerViewModel vm)
                await vm.Home();
        });

        return true;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var status = await Permissions.CheckStatusAsync<Permissions.Camera>();

        if (status != PermissionStatus.Granted)
            status = await Permissions.RequestAsync<Permissions.Camera>();

        if (status != PermissionStatus.Granted)
        {
            await DisplayAlert("Kamera icazəsi", "QR kodu skan etmək üçün kamera icazəsi verilməlidir.", "OK");
            return;
        }

        MainThread.BeginInvokeOnMainThread(() =>
        {
            Scanner.IsEnabled = true;
            Scanner.IsDetecting = true;
        });
    }

    protected override void OnDisappearing()
    {
        if (Scanner is not null)
        {
            Scanner.IsDetecting = false;
            Scanner.IsEnabled = false;
        }

        base.OnDisappearing();
    }
}
'@
    Set-Content $qrScanner -Value $qrScannerContent -Encoding UTF8
    Write-Step "View/QrScannerPage.xaml.cs yeniləndi"
} else {
    Write-Step "View/QrScannerPage.xaml.cs tapılmadı, skip edildi"
}

# 5) MauiProgram.cs — iOS WKWebView mapping əlavə et, duplicate etmə
if (Test-Path $mauiProgram) {
    $mauiText = Get-Content $mauiProgram -Raw -Encoding UTF8

    if ($mauiText -notmatch 'AllowsInlineMediaPlayback') {
        $iosWebViewBlock = @'
#endif

#if IOS
                var wv = handler.PlatformView;
                wv.Configuration.AllowsInlineMediaPlayback = true;

                if (OperatingSystem.IsIOSVersionAtLeast(10))
                    wv.Configuration.MediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypes.None;

                wv.AllowsBackForwardNavigationGestures = true;
'@

        $pattern = '#endif\s*\}\);\s*\}\);'
        if ($mauiText -match $pattern) {
            $mauiText = [regex]::Replace($mauiText, $pattern, "$iosWebViewBlock`r`n#endif`r`n            });`r`n        });", 1)
            Set-Content $mauiProgram -Value $mauiText -Encoding UTF8
            Write-Step "MauiProgram.cs iOS WebView mapping ilə yeniləndi"
        } else {
            Write-Step "MauiProgram.cs avtomatik dəyişdirilə bilmədi. WebView iOS bloku əl ilə əlavə edilməlidir."
        }
    } else {
        Write-Step "MauiProgram.cs artıq iOS WebView mapping saxlayır"
    }
} else {
    Write-Step "MauiProgram.cs tapılmadı, skip edildi"
}

Write-Host ""
Write-Step "Bitdi. İndi yoxla:"
Write-Host "  git diff"
Write-Host "  dotnet build -f net8.0-ios"
