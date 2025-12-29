using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MetanetA_MobileApp.Services.Abstractions
{
    public interface IUserSession
    {
        string? PhoneNumber { get; set; }
        string? OtpCode { get; set; }
    }
}
