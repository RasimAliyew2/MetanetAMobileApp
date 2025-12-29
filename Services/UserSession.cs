using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using MetanetA_MobileApp.Services.Abstractions;

namespace MetanetA_MobileApp.Services
{
    public partial class UserSession : ObservableObject, IUserSession
    {
        [ObservableProperty] private string? phoneNumber;
        [ObservableProperty] private string? otpCode;
    }
}
