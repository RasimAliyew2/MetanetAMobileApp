using CommunityToolkit.Mvvm.Input;

namespace MetanetA_MobileApp.ViewModels;

public partial class SignUpViewModel
{
    [RelayCommand]
    private void ToggleTerms()
    {
        IsTermsAccepted = !IsTermsAccepted;
    }
}
