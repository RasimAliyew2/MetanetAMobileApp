using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using MetanetA_MobileApp.Services.Abstractions;

namespace MetanetA_MobileApp.Model
{
    public partial class GiftItem : ObservableObject, IGiftItem
    {
        [ObservableProperty]
        public string name;
        [ObservableProperty]
        public string description;
        [ObservableProperty]
        public string title;
        [ObservableProperty]
        public string imageUrl;
        [ObservableProperty]
        public float price;
        [ObservableProperty]
        public bool bought;
    }
}
