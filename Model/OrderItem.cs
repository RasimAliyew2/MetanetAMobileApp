using System;
using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;


namespace MetanetA_MobileApp.Model
{
    public partial class OrderItem : ObservableObject
    {
        [ObservableProperty]
        private string orderNumber;

        [ObservableProperty]
        private DateTime createdAt;

        [ObservableProperty]
        private string status;

        [ObservableProperty]
        private decimal totalPrice;

        public ObservableCollection<OrderLineItem> Products { get; set; } = new();
    }

    public partial class OrderLineItem : ObservableObject
    {
        [ObservableProperty]
        private string name;

        [ObservableProperty]
        private string image;

        [ObservableProperty]
        private int quantity;

        [ObservableProperty]
        private decimal unitPrice;

        public decimal LineTotal => Quantity * UnitPrice;
    }
}