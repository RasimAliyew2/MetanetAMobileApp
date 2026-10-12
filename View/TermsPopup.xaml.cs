using System;
using CommunityToolkit.Maui.Extensions;
using CommunityToolkit.Maui.Views;

namespace MetanetA_MobileApp.View
{
    public partial class TermsPopup : Popup
    {
        public TermsPopup()
        {
            InitializeComponent();
        }

        private async void Close_Clicked(object sender, EventArgs e)
        {
            await Shell.Current.ClosePopupAsync();
        }
    }
}
