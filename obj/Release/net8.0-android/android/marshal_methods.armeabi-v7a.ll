; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [141 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [282 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 91
	i32 40744412, ; 1: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 61
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 132
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 52
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 124
	i32 147669188, ; 6: Plugin.Firebase.Core.dll => 0x8cd40c4 => 55
	i32 165246403, ; 7: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 64
	i32 182336117, ; 8: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 83
	i32 195452805, ; 9: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 10: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 108
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 57
	i32 336156722, ; 15: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 71
	i32 356389973, ; 17: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 18: System.Threading.Thread.dll => 0x16a510e1 => 132
	i32 385762202, ; 19: System.Memory.dll => 0x16fe439a => 115
	i32 395744057, ; 20: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 21: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 22: System.Collections => 0x1a61054f => 105
	i32 450948140, ; 23: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 70
	i32 456227837, ; 24: System.Web.HttpUtility.dll => 0x1b317bfd => 134
	i32 469710990, ; 25: System.dll => 0x1bff388e => 136
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 121
	i32 500358224, ; 27: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 28: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 507148113, ; 29: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 89
	i32 513247710, ; 30: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 45
	i32 539058512, ; 31: Microsoft.Extensions.Logging => 0x20216150 => 42
	i32 592146354, ; 32: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 33: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 34: Xamarin.AndroidX.CustomView => 0x2568904f => 68
	i32 627931235, ; 35: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 36: System.Text.Encodings.Web.dll => 0x27787397 => 129
	i32 663517072, ; 37: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 84
	i32 672442732, ; 38: System.Collections.Concurrent => 0x2814a96c => 102
	i32 688181140, ; 39: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 40: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 41: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 42: System.Runtime.Loader.dll => 0x2b15ed29 => 125
	i32 759454413, ; 43: System.Net.Requests => 0x2d445acd => 119
	i32 775507847, ; 44: System.IO.Compression => 0x2e394f87 => 112
	i32 777317022, ; 45: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 46: Microsoft.Extensions.Options => 0x2f0980eb => 44
	i32 823281589, ; 47: System.Private.Uri.dll => 0x311247b5 => 122
	i32 830298997, ; 48: System.IO.Compression.Brotli => 0x317d5b75 => 111
	i32 839353180, ; 49: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 100
	i32 856800933, ; 50: Plugin.Firebase.CloudMessaging.dll => 0x3311bea5 => 54
	i32 865465478, ; 51: zxing.dll => 0x3395f486 => 98
	i32 904024072, ; 52: System.ComponentModel.Primitives.dll => 0x35e25008 => 106
	i32 908888060, ; 53: Microsoft.Maui.Maps => 0x362c87fc => 53
	i32 926902833, ; 54: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 55: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 91
	i32 965247473, ; 56: Plugin.Firebase.Core => 0x398881f1 => 55
	i32 967690846, ; 57: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 71
	i32 992768348, ; 58: System.Collections.dll => 0x3b2c715c => 105
	i32 1012816738, ; 59: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 81
	i32 1028951442, ; 60: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 41
	i32 1029334545, ; 61: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 62: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 58
	i32 1044663988, ; 63: System.Linq.Expressions.dll => 0x3e444eb4 => 113
	i32 1052210849, ; 64: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 73
	i32 1082857460, ; 65: System.ComponentModel.TypeConverter => 0x408b17f4 => 107
	i32 1084122840, ; 66: Xamarin.Kotlin.StdLib => 0x409e66d8 => 96
	i32 1098259244, ; 67: System => 0x41761b2c => 136
	i32 1118262833, ; 68: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 69: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 70: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 78
	i32 1203215381, ; 71: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 72: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1234928153, ; 73: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 74: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 75: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 69
	i32 1324164729, ; 76: System.Linq => 0x4eed2679 => 114
	i32 1333047053, ; 77: Xamarin.Firebase.Common => 0x4f74af0d => 87
	i32 1373134921, ; 78: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 79: Xamarin.AndroidX.SavedState => 0x52114ed3 => 81
	i32 1406073936, ; 80: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 65
	i32 1430672901, ; 81: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 82: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 83: System.Collections.Immutable.dll => 0x5718a9ef => 103
	i32 1462112819, ; 84: System.IO.Compression.dll => 0x57261233 => 112
	i32 1469204771, ; 85: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 59
	i32 1470490898, ; 86: Microsoft.Extensions.Primitives => 0x57a5e912 => 45
	i32 1479771757, ; 87: System.Collections.Immutable => 0x5833866d => 103
	i32 1480492111, ; 88: System.IO.Compression.Brotli.dll => 0x583e844f => 111
	i32 1493001747, ; 89: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 90: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 91: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 131
	i32 1551623176, ; 92: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 93: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 75
	i32 1624863272, ; 94: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 86
	i32 1634654947, ; 95: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 96: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 67
	i32 1639515021, ; 97: System.Net.Http.dll => 0x61b9038d => 116
	i32 1639986890, ; 98: System.Text.RegularExpressions => 0x61c036ca => 131
	i32 1657153582, ; 99: System.Runtime => 0x62c6282e => 127
	i32 1658251792, ; 100: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 90
	i32 1677501392, ; 101: System.Net.Primitives.dll => 0x63fca3d0 => 118
	i32 1679769178, ; 102: System.Security.Cryptography => 0x641f3e5a => 128
	i32 1729485958, ; 103: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 63
	i32 1736233607, ; 104: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 105: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 106: System.Diagnostics.TraceSource.dll => 0x69239124 => 110
	i32 1766324549, ; 107: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 83
	i32 1770582343, ; 108: Microsoft.Extensions.Logging.dll => 0x6988f147 => 42
	i32 1780572499, ; 109: Mono.Android.Runtime.dll => 0x6a216153 => 139
	i32 1782862114, ; 110: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 111: Xamarin.AndroidX.Fragment => 0x6a96652d => 70
	i32 1793755602, ; 112: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 113: Xamarin.AndroidX.Loader => 0x6bcd3296 => 75
	i32 1813058853, ; 114: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 96
	i32 1813201214, ; 115: Xamarin.Google.Android.Material => 0x6c13413e => 90
	i32 1818569960, ; 116: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 79
	i32 1828688058, ; 117: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 43
	i32 1842015223, ; 118: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 119: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 120: System.Linq.Expressions => 0x6ec71a65 => 113
	i32 1875935024, ; 121: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1908813208, ; 122: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 93
	i32 1910275211, ; 123: System.Collections.NonGeneric.dll => 0x71dc7c8b => 104
	i32 1933215285, ; 124: Xamarin.Firebase.Messaging.dll => 0x733a8635 => 88
	i32 1961813231, ; 125: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 82
	i32 1968388702, ; 126: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 2003115576, ; 127: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 128: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 73
	i32 2025202353, ; 129: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 130: System.Private.Xml => 0x79eb68ee => 123
	i32 2055257422, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 72
	i32 2066184531, ; 132: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 133: System.Diagnostics.TraceSource => 0x7b6f419e => 110
	i32 2079903147, ; 134: System.Runtime.dll => 0x7bf8cdab => 127
	i32 2090596640, ; 135: System.Numerics.Vectors => 0x7c9bf920 => 120
	i32 2127167465, ; 136: System.Console => 0x7ec9ffe9 => 109
	i32 2129483829, ; 137: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 92
	i32 2159891885, ; 138: Microsoft.Maui => 0x80bd55ad => 50
	i32 2169148018, ; 139: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 140: Microsoft.Extensions.Options.dll => 0x820d22b3 => 44
	i32 2192057212, ; 141: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 43
	i32 2193016926, ; 142: System.ObjectModel.dll => 0x82b6c85e => 121
	i32 2201107256, ; 143: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 97
	i32 2201231467, ; 144: System.Net.Http => 0x8334206b => 116
	i32 2207618523, ; 145: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 146: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2270573516, ; 147: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 148: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 80
	i32 2298471582, ; 149: System.Net.Mail => 0x88ffe49e => 117
	i32 2303073227, ; 150: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 48
	i32 2303942373, ; 151: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 152: System.Private.CoreLib.dll => 0x896b7878 => 137
	i32 2353062107, ; 153: System.Net.Primitives => 0x8c40e0db => 118
	i32 2368005991, ; 154: System.Xml.ReaderWriter.dll => 0x8d24e767 => 135
	i32 2371007202, ; 155: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2395872292, ; 156: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 157: System.Web.HttpUtility => 0x8f24faee => 134
	i32 2427813419, ; 158: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 159: System.Console.dll => 0x912896e5 => 109
	i32 2475788418, ; 160: Java.Interop.dll => 0x93918882 => 138
	i32 2480646305, ; 161: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2483742551, ; 162: Xamarin.Firebase.Messaging => 0x940ae757 => 88
	i32 2550873716, ; 163: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 164: System.Text.Encodings.Web => 0x9930ee42 => 129
	i32 2593496499, ; 165: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 166: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 97
	i32 2617129537, ; 167: System.Private.Xml.dll => 0x9bfe3a41 => 123
	i32 2618696925, ; 168: MetanetA_MobileApp.dll => 0x9c1624dd => 101
	i32 2620871830, ; 169: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 67
	i32 2626831493, ; 170: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 171: System.Runtime.Loader => 0x9ec4cf01 => 125
	i32 2724373263, ; 172: System.Runtime.Numerics.dll => 0xa262a30f => 126
	i32 2732626843, ; 173: Xamarin.AndroidX.Activity => 0xa2e0939b => 57
	i32 2737747696, ; 174: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 59
	i32 2752995522, ; 175: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 176: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 49
	i32 2764765095, ; 177: Microsoft.Maui.dll => 0xa4caf7a7 => 50
	i32 2778768386, ; 178: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 85
	i32 2785988530, ; 179: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 180: Microsoft.Maui.Graphics => 0xa7008e0b => 52
	i32 2806116107, ; 181: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 182: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 65
	i32 2831556043, ; 183: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847418871, ; 184: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 92
	i32 2853208004, ; 185: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 85
	i32 2861189240, ; 186: Microsoft.Maui.Essentials => 0xaa8a4878 => 51
	i32 2868488919, ; 187: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 188: System.Private.CoreLib => 0xad6f1e8a => 137
	i32 2916838712, ; 189: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 86
	i32 2919462931, ; 190: System.Numerics.Vectors.dll => 0xae037813 => 120
	i32 2959614098, ; 191: System.ComponentModel.dll => 0xb0682092 => 108
	i32 2965157864, ; 192: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 62
	i32 2978675010, ; 193: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 69
	i32 2987532451, ; 194: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 82
	i32 2987996059, ; 195: MetanetA_MobileApp => 0xb219339b => 101
	i32 2991449226, ; 196: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 60
	i32 3000842441, ; 197: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 62
	i32 3017076677, ; 198: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 94
	i32 3038032645, ; 199: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 200: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 60
	i32 3057625584, ; 201: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 76
	i32 3058099980, ; 202: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 95
	i32 3059408633, ; 203: Mono.Android.Runtime => 0xb65adef9 => 139
	i32 3059793426, ; 204: System.ComponentModel.Primitives => 0xb660be12 => 106
	i32 3071899978, ; 205: Xamarin.Firebase.Common.dll => 0xb719794a => 87
	i32 3077302341, ; 206: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3155362983, ; 207: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 89
	i32 3178803400, ; 208: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 77
	i32 3215347189, ; 209: zxing => 0xbfa64df5 => 98
	i32 3220365878, ; 210: System.Threading => 0xbff2e236 => 133
	i32 3230466174, ; 211: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 93
	i32 3258312781, ; 212: Xamarin.AndroidX.CardView => 0xc235e84d => 63
	i32 3286373667, ; 213: ZXing.Net.MAUI.dll => 0xc3e21523 => 99
	i32 3305363605, ; 214: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 215: System.Net.Requests.dll => 0xc5b097e4 => 119
	i32 3317135071, ; 216: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 68
	i32 3346324047, ; 217: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 78
	i32 3357674450, ; 218: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 219: System.Text.Json => 0xc82afec1 => 130
	i32 3362522851, ; 220: Xamarin.AndroidX.Core => 0xc86c06e3 => 66
	i32 3366347497, ; 221: Java.Interop => 0xc8a662e9 => 138
	i32 3374999561, ; 222: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 80
	i32 3381016424, ; 223: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 224: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 40
	i32 3452344032, ; 225: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 46
	i32 3463511458, ; 226: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 227: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 107
	i32 3476120550, ; 228: Mono.Android => 0xcf3163e6 => 140
	i32 3479583265, ; 229: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 230: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 231: System.Text.Json.dll => 0xcfbaacae => 130
	i32 3500773090, ; 232: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 48
	i32 3580758918, ; 233: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 234: System.Linq.dll => 0xd715a361 => 114
	i32 3641597786, ; 235: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 72
	i32 3643446276, ; 236: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 237: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 77
	i32 3657292374, ; 238: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3672681054, ; 239: Mono.Android.dll => 0xdae8aa5e => 140
	i32 3676461095, ; 240: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 61
	i32 3697841164, ; 241: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 242: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 76
	i32 3748608112, ; 243: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 56
	i32 3751582913, ; 244: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 100
	i32 3786282454, ; 245: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 64
	i32 3792276235, ; 246: System.Collections.NonGeneric => 0xe2098b0b => 104
	i32 3800979733, ; 247: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 46
	i32 3817368567, ; 248: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 249: System.Security.Cryptography.dll => 0xe3df9d2b => 128
	i32 3841636137, ; 250: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 41
	i32 3842894692, ; 251: ZXing.Net.MAUI => 0xe50deb64 => 99
	i32 3844307129, ; 252: System.Net.Mail.dll => 0xe52378b9 => 117
	i32 3849253459, ; 253: System.Runtime.InteropServices.dll => 0xe56ef253 => 124
	i32 3889960447, ; 254: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 255: System.Collections.Concurrent.dll => 0xe839deed => 102
	i32 3896760992, ; 256: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 66
	i32 3921031405, ; 257: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 84
	i32 3928044579, ; 258: System.Xml.ReaderWriter => 0xea213423 => 135
	i32 3931092270, ; 259: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 79
	i32 3955647286, ; 260: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 58
	i32 3970018735, ; 261: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 95
	i32 3979528423, ; 262: Plugin.Firebase.CloudMessaging => 0xed32c8e7 => 54
	i32 3980434154, ; 263: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 264: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 265: System.Memory => 0xeff49a63 => 115
	i32 4046471985, ; 266: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 49
	i32 4073602200, ; 267: System.Threading.dll => 0xf2ce3c98 => 133
	i32 4094352644, ; 268: Microsoft.Maui.Essentials.dll => 0xf40add04 => 51
	i32 4100113165, ; 269: System.Private.Uri => 0xf462c30d => 122
	i32 4102112229, ; 270: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 271: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 272: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 40
	i32 4150914736, ; 273: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 274: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 74
	i32 4190991637, ; 275: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 53
	i32 4213026141, ; 276: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 56
	i32 4271975918, ; 277: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 278: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 279: System.Runtime.Numerics => 0xfecef6ea => 126
	i32 4278134329, ; 280: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 94
	i32 4292120959 ; 281: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 74
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [282 x i32] [
	i32 91, ; 0
	i32 61, ; 1
	i32 132, ; 2
	i32 33, ; 3
	i32 52, ; 4
	i32 124, ; 5
	i32 55, ; 6
	i32 64, ; 7
	i32 83, ; 8
	i32 30, ; 9
	i32 31, ; 10
	i32 108, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 57, ; 14
	i32 15, ; 15
	i32 71, ; 16
	i32 14, ; 17
	i32 132, ; 18
	i32 115, ; 19
	i32 34, ; 20
	i32 26, ; 21
	i32 105, ; 22
	i32 70, ; 23
	i32 134, ; 24
	i32 136, ; 25
	i32 121, ; 26
	i32 13, ; 27
	i32 7, ; 28
	i32 89, ; 29
	i32 45, ; 30
	i32 42, ; 31
	i32 21, ; 32
	i32 35, ; 33
	i32 68, ; 34
	i32 19, ; 35
	i32 129, ; 36
	i32 84, ; 37
	i32 102, ; 38
	i32 1, ; 39
	i32 16, ; 40
	i32 4, ; 41
	i32 125, ; 42
	i32 119, ; 43
	i32 112, ; 44
	i32 25, ; 45
	i32 44, ; 46
	i32 122, ; 47
	i32 111, ; 48
	i32 100, ; 49
	i32 54, ; 50
	i32 98, ; 51
	i32 106, ; 52
	i32 53, ; 53
	i32 28, ; 54
	i32 91, ; 55
	i32 55, ; 56
	i32 71, ; 57
	i32 105, ; 58
	i32 81, ; 59
	i32 41, ; 60
	i32 3, ; 61
	i32 58, ; 62
	i32 113, ; 63
	i32 73, ; 64
	i32 107, ; 65
	i32 96, ; 66
	i32 136, ; 67
	i32 16, ; 68
	i32 22, ; 69
	i32 78, ; 70
	i32 20, ; 71
	i32 37, ; 72
	i32 18, ; 73
	i32 2, ; 74
	i32 69, ; 75
	i32 114, ; 76
	i32 87, ; 77
	i32 32, ; 78
	i32 81, ; 79
	i32 65, ; 80
	i32 0, ; 81
	i32 6, ; 82
	i32 103, ; 83
	i32 112, ; 84
	i32 59, ; 85
	i32 45, ; 86
	i32 103, ; 87
	i32 111, ; 88
	i32 10, ; 89
	i32 5, ; 90
	i32 131, ; 91
	i32 25, ; 92
	i32 75, ; 93
	i32 86, ; 94
	i32 36, ; 95
	i32 67, ; 96
	i32 116, ; 97
	i32 131, ; 98
	i32 127, ; 99
	i32 90, ; 100
	i32 118, ; 101
	i32 128, ; 102
	i32 63, ; 103
	i32 23, ; 104
	i32 1, ; 105
	i32 110, ; 106
	i32 83, ; 107
	i32 42, ; 108
	i32 139, ; 109
	i32 17, ; 110
	i32 70, ; 111
	i32 9, ; 112
	i32 75, ; 113
	i32 96, ; 114
	i32 90, ; 115
	i32 79, ; 116
	i32 43, ; 117
	i32 29, ; 118
	i32 26, ; 119
	i32 113, ; 120
	i32 8, ; 121
	i32 93, ; 122
	i32 104, ; 123
	i32 88, ; 124
	i32 82, ; 125
	i32 38, ; 126
	i32 5, ; 127
	i32 73, ; 128
	i32 0, ; 129
	i32 123, ; 130
	i32 72, ; 131
	i32 4, ; 132
	i32 110, ; 133
	i32 127, ; 134
	i32 120, ; 135
	i32 109, ; 136
	i32 92, ; 137
	i32 50, ; 138
	i32 12, ; 139
	i32 44, ; 140
	i32 43, ; 141
	i32 121, ; 142
	i32 97, ; 143
	i32 116, ; 144
	i32 14, ; 145
	i32 39, ; 146
	i32 8, ; 147
	i32 80, ; 148
	i32 117, ; 149
	i32 48, ; 150
	i32 18, ; 151
	i32 137, ; 152
	i32 118, ; 153
	i32 135, ; 154
	i32 38, ; 155
	i32 13, ; 156
	i32 134, ; 157
	i32 10, ; 158
	i32 109, ; 159
	i32 138, ; 160
	i32 47, ; 161
	i32 88, ; 162
	i32 11, ; 163
	i32 129, ; 164
	i32 20, ; 165
	i32 97, ; 166
	i32 123, ; 167
	i32 101, ; 168
	i32 67, ; 169
	i32 15, ; 170
	i32 125, ; 171
	i32 126, ; 172
	i32 57, ; 173
	i32 59, ; 174
	i32 21, ; 175
	i32 49, ; 176
	i32 50, ; 177
	i32 85, ; 178
	i32 27, ; 179
	i32 52, ; 180
	i32 6, ; 181
	i32 65, ; 182
	i32 19, ; 183
	i32 92, ; 184
	i32 85, ; 185
	i32 51, ; 186
	i32 36, ; 187
	i32 137, ; 188
	i32 86, ; 189
	i32 120, ; 190
	i32 108, ; 191
	i32 62, ; 192
	i32 69, ; 193
	i32 82, ; 194
	i32 101, ; 195
	i32 60, ; 196
	i32 62, ; 197
	i32 94, ; 198
	i32 34, ; 199
	i32 60, ; 200
	i32 76, ; 201
	i32 95, ; 202
	i32 139, ; 203
	i32 106, ; 204
	i32 87, ; 205
	i32 12, ; 206
	i32 89, ; 207
	i32 77, ; 208
	i32 98, ; 209
	i32 133, ; 210
	i32 93, ; 211
	i32 63, ; 212
	i32 99, ; 213
	i32 7, ; 214
	i32 119, ; 215
	i32 68, ; 216
	i32 78, ; 217
	i32 24, ; 218
	i32 130, ; 219
	i32 66, ; 220
	i32 138, ; 221
	i32 80, ; 222
	i32 3, ; 223
	i32 40, ; 224
	i32 46, ; 225
	i32 11, ; 226
	i32 107, ; 227
	i32 140, ; 228
	i32 24, ; 229
	i32 23, ; 230
	i32 130, ; 231
	i32 48, ; 232
	i32 31, ; 233
	i32 114, ; 234
	i32 72, ; 235
	i32 28, ; 236
	i32 77, ; 237
	i32 39, ; 238
	i32 140, ; 239
	i32 61, ; 240
	i32 33, ; 241
	i32 76, ; 242
	i32 56, ; 243
	i32 100, ; 244
	i32 64, ; 245
	i32 104, ; 246
	i32 46, ; 247
	i32 35, ; 248
	i32 128, ; 249
	i32 41, ; 250
	i32 99, ; 251
	i32 117, ; 252
	i32 124, ; 253
	i32 32, ; 254
	i32 102, ; 255
	i32 66, ; 256
	i32 84, ; 257
	i32 135, ; 258
	i32 79, ; 259
	i32 58, ; 260
	i32 95, ; 261
	i32 54, ; 262
	i32 27, ; 263
	i32 9, ; 264
	i32 115, ; 265
	i32 49, ; 266
	i32 133, ; 267
	i32 51, ; 268
	i32 122, ; 269
	i32 22, ; 270
	i32 17, ; 271
	i32 40, ; 272
	i32 29, ; 273
	i32 74, ; 274
	i32 53, ; 275
	i32 56, ; 276
	i32 47, ; 277
	i32 37, ; 278
	i32 126, ; 279
	i32 94, ; 280
	i32 74 ; 281
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
