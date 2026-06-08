using System;
using System.Collections.ObjectModel;
using System.Linq;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Cart;

namespace MetanetA_MobileApp.Services.Sales
{
    public class OrdersService
    {
        public ObservableCollection<OrderItem> Orders { get; } = new();

        public void AddOrderFromCart(CartService cart)
        {
            if (cart == null || !cart.Items.Any())
                return;

            var order = new OrderItem
            {
                OrderNumber = $"ORD-{DateTime.Now:yyyyMMddHHmmss}",
                CreatedAt = DateTime.Now,
                Status = "Hazırlanır",
                TotalPrice = cart.TotalPrice
            };

            foreach (var item in cart.Items)
            {
                order.Products.Add(new OrderLineItem
                {
                    Name = item.Item.Name,
                    Image = item.Item.Image,
                    Quantity = item.Quantity,
                    UnitPrice = item.Item.Price
                });
            }

            Orders.Insert(0, order);
        }
    }
}