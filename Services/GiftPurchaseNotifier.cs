using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;

namespace MetanetA_MobileApp.Services
{
    public class GiftPurchaseNotifier : IGiftPurchaseNotifier
    {
        public event Action<BonusTransaction> GiftPurchaseAdded;

        public void PublishNewGiftPurchase(BonusTransaction row)
        {
            GiftPurchaseAdded?.Invoke(row);
        }
    }
}
