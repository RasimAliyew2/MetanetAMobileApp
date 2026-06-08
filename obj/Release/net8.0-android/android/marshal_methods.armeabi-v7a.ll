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

@assembly_image_cache = dso_local local_unnamed_addr global [134 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [268 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 84
	i32 40744412, ; 1: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 59
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 125
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 52
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 117
	i32 165246403, ; 6: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 62
	i32 182336117, ; 7: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 80
	i32 195452805, ; 8: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 9: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 10: System.ComponentModel => 0xc38ff48 => 101
	i32 280992041, ; 11: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 55
	i32 336156722, ; 14: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 69
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 125
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 108
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 20: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 98
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 68
	i32 456227837, ; 23: System.Web.HttpUtility.dll => 0x1b317bfd => 127
	i32 469710990, ; 24: System.dll => 0x1bff388e => 129
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 114
	i32 500358224, ; 26: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 45
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 42
	i32 592146354, ; 30: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 31: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 66
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 34: System.Text.Encodings.Web.dll => 0x27787397 => 122
	i32 672442732, ; 35: System.Collections.Concurrent => 0x2814a96c => 95
	i32 688181140, ; 36: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 37: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 38: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 39: System.Runtime.Loader.dll => 0x2b15ed29 => 118
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 112
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 105
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 44
	i32 823281589, ; 44: System.Private.Uri.dll => 0x311247b5 => 115
	i32 830298997, ; 45: System.IO.Compression.Brotli => 0x317d5b75 => 104
	i32 839353180, ; 46: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 93
	i32 865465478, ; 47: zxing.dll => 0x3395f486 => 91
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 99
	i32 908888060, ; 49: Microsoft.Maui.Maps => 0x362c87fc => 53
	i32 926902833, ; 50: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 51: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 84
	i32 967690846, ; 52: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 69
	i32 992768348, ; 53: System.Collections.dll => 0x3b2c715c => 98
	i32 1012816738, ; 54: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 79
	i32 1028951442, ; 55: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 41
	i32 1029334545, ; 56: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 57: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 56
	i32 1044663988, ; 58: System.Linq.Expressions.dll => 0x3e444eb4 => 106
	i32 1052210849, ; 59: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 71
	i32 1082857460, ; 60: System.ComponentModel.TypeConverter => 0x408b17f4 => 100
	i32 1084122840, ; 61: Xamarin.Kotlin.StdLib => 0x409e66d8 => 89
	i32 1098259244, ; 62: System => 0x41761b2c => 129
	i32 1118262833, ; 63: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 64: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 65: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 76
	i32 1203215381, ; 66: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 67: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1234928153, ; 68: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 69: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 70: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 67
	i32 1324164729, ; 71: System.Linq => 0x4eed2679 => 107
	i32 1373134921, ; 72: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 73: Xamarin.AndroidX.SavedState => 0x52114ed3 => 79
	i32 1406073936, ; 74: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 63
	i32 1430672901, ; 75: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 76: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 77: System.Collections.Immutable.dll => 0x5718a9ef => 96
	i32 1462112819, ; 78: System.IO.Compression.dll => 0x57261233 => 105
	i32 1469204771, ; 79: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 57
	i32 1470490898, ; 80: Microsoft.Extensions.Primitives => 0x57a5e912 => 45
	i32 1479771757, ; 81: System.Collections.Immutable => 0x5833866d => 96
	i32 1480492111, ; 82: System.IO.Compression.Brotli.dll => 0x583e844f => 104
	i32 1493001747, ; 83: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 84: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 85: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 124
	i32 1551623176, ; 86: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 73
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 82
	i32 1634654947, ; 89: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 90: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 65
	i32 1639515021, ; 91: System.Net.Http.dll => 0x61b9038d => 109
	i32 1639986890, ; 92: System.Text.RegularExpressions => 0x61c036ca => 124
	i32 1657153582, ; 93: System.Runtime => 0x62c6282e => 120
	i32 1658251792, ; 94: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 83
	i32 1677501392, ; 95: System.Net.Primitives.dll => 0x63fca3d0 => 111
	i32 1679769178, ; 96: System.Security.Cryptography => 0x641f3e5a => 121
	i32 1729485958, ; 97: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 61
	i32 1736233607, ; 98: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 100: System.Diagnostics.TraceSource.dll => 0x69239124 => 103
	i32 1766324549, ; 101: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 80
	i32 1770582343, ; 102: Microsoft.Extensions.Logging.dll => 0x6988f147 => 42
	i32 1780572499, ; 103: Mono.Android.Runtime.dll => 0x6a216153 => 132
	i32 1782862114, ; 104: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 105: Xamarin.AndroidX.Fragment => 0x6a96652d => 68
	i32 1793755602, ; 106: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 107: Xamarin.AndroidX.Loader => 0x6bcd3296 => 73
	i32 1813058853, ; 108: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 89
	i32 1813201214, ; 109: Xamarin.Google.Android.Material => 0x6c13413e => 83
	i32 1818569960, ; 110: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 77
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 43
	i32 1842015223, ; 112: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 113: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 114: System.Linq.Expressions => 0x6ec71a65 => 106
	i32 1875935024, ; 115: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1908813208, ; 116: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 86
	i32 1910275211, ; 117: System.Collections.NonGeneric.dll => 0x71dc7c8b => 97
	i32 1968388702, ; 118: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 2003115576, ; 119: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 120: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 71
	i32 2025202353, ; 121: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 122: System.Private.Xml => 0x79eb68ee => 116
	i32 2055257422, ; 123: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 70
	i32 2066184531, ; 124: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 125: System.Diagnostics.TraceSource => 0x7b6f419e => 103
	i32 2079903147, ; 126: System.Runtime.dll => 0x7bf8cdab => 120
	i32 2090596640, ; 127: System.Numerics.Vectors => 0x7c9bf920 => 113
	i32 2127167465, ; 128: System.Console => 0x7ec9ffe9 => 102
	i32 2129483829, ; 129: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 85
	i32 2159891885, ; 130: Microsoft.Maui => 0x80bd55ad => 50
	i32 2169148018, ; 131: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 132: Microsoft.Extensions.Options.dll => 0x820d22b3 => 44
	i32 2192057212, ; 133: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 43
	i32 2193016926, ; 134: System.ObjectModel.dll => 0x82b6c85e => 114
	i32 2201107256, ; 135: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 90
	i32 2201231467, ; 136: System.Net.Http => 0x8334206b => 109
	i32 2207618523, ; 137: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 138: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2270573516, ; 139: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 78
	i32 2298471582, ; 141: System.Net.Mail => 0x88ffe49e => 110
	i32 2303073227, ; 142: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 48
	i32 2303942373, ; 143: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 144: System.Private.CoreLib.dll => 0x896b7878 => 130
	i32 2353062107, ; 145: System.Net.Primitives => 0x8c40e0db => 111
	i32 2368005991, ; 146: System.Xml.ReaderWriter.dll => 0x8d24e767 => 128
	i32 2371007202, ; 147: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2395872292, ; 148: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 149: System.Web.HttpUtility => 0x8f24faee => 127
	i32 2427813419, ; 150: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 151: System.Console.dll => 0x912896e5 => 102
	i32 2475788418, ; 152: Java.Interop.dll => 0x93918882 => 131
	i32 2480646305, ; 153: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2550873716, ; 154: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 155: System.Text.Encodings.Web => 0x9930ee42 => 122
	i32 2593496499, ; 156: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 157: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 90
	i32 2617129537, ; 158: System.Private.Xml.dll => 0x9bfe3a41 => 116
	i32 2618696925, ; 159: MetanetA_MobileApp.dll => 0x9c1624dd => 94
	i32 2620871830, ; 160: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 65
	i32 2626831493, ; 161: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 162: System.Runtime.Loader => 0x9ec4cf01 => 118
	i32 2724373263, ; 163: System.Runtime.Numerics.dll => 0xa262a30f => 119
	i32 2732626843, ; 164: Xamarin.AndroidX.Activity => 0xa2e0939b => 55
	i32 2737747696, ; 165: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 57
	i32 2752995522, ; 166: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 167: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 49
	i32 2764765095, ; 168: Microsoft.Maui.dll => 0xa4caf7a7 => 50
	i32 2778768386, ; 169: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 81
	i32 2785988530, ; 170: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 171: Microsoft.Maui.Graphics => 0xa7008e0b => 52
	i32 2806116107, ; 172: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 173: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 63
	i32 2831556043, ; 174: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847418871, ; 175: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 85
	i32 2853208004, ; 176: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 81
	i32 2861189240, ; 177: Microsoft.Maui.Essentials => 0xaa8a4878 => 51
	i32 2868488919, ; 178: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 179: System.Private.CoreLib => 0xad6f1e8a => 130
	i32 2916838712, ; 180: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 82
	i32 2919462931, ; 181: System.Numerics.Vectors.dll => 0xae037813 => 113
	i32 2959614098, ; 182: System.ComponentModel.dll => 0xb0682092 => 101
	i32 2965157864, ; 183: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 60
	i32 2978675010, ; 184: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 67
	i32 2987996059, ; 185: MetanetA_MobileApp => 0xb219339b => 94
	i32 2991449226, ; 186: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 58
	i32 3000842441, ; 187: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 60
	i32 3017076677, ; 188: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 87
	i32 3038032645, ; 189: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 190: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 58
	i32 3057625584, ; 191: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 74
	i32 3058099980, ; 192: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 88
	i32 3059408633, ; 193: Mono.Android.Runtime => 0xb65adef9 => 132
	i32 3059793426, ; 194: System.ComponentModel.Primitives => 0xb660be12 => 99
	i32 3077302341, ; 195: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 196: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 75
	i32 3215347189, ; 197: zxing => 0xbfa64df5 => 91
	i32 3220365878, ; 198: System.Threading => 0xbff2e236 => 126
	i32 3230466174, ; 199: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 86
	i32 3258312781, ; 200: Xamarin.AndroidX.CardView => 0xc235e84d => 61
	i32 3286373667, ; 201: ZXing.Net.MAUI.dll => 0xc3e21523 => 92
	i32 3305363605, ; 202: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 203: System.Net.Requests.dll => 0xc5b097e4 => 112
	i32 3317135071, ; 204: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 66
	i32 3346324047, ; 205: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 76
	i32 3357674450, ; 206: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 207: System.Text.Json => 0xc82afec1 => 123
	i32 3362522851, ; 208: Xamarin.AndroidX.Core => 0xc86c06e3 => 64
	i32 3366347497, ; 209: Java.Interop => 0xc8a662e9 => 131
	i32 3374999561, ; 210: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 78
	i32 3381016424, ; 211: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 212: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 40
	i32 3452344032, ; 213: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 46
	i32 3463511458, ; 214: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 215: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 100
	i32 3476120550, ; 216: Mono.Android => 0xcf3163e6 => 133
	i32 3479583265, ; 217: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 218: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 219: System.Text.Json.dll => 0xcfbaacae => 123
	i32 3500773090, ; 220: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 48
	i32 3580758918, ; 221: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 222: System.Linq.dll => 0xd715a361 => 107
	i32 3641597786, ; 223: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 70
	i32 3643446276, ; 224: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 225: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 75
	i32 3657292374, ; 226: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3672681054, ; 227: Mono.Android.dll => 0xdae8aa5e => 133
	i32 3676461095, ; 228: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 59
	i32 3697841164, ; 229: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 230: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 74
	i32 3748608112, ; 231: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 54
	i32 3751582913, ; 232: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 93
	i32 3786282454, ; 233: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 62
	i32 3792276235, ; 234: System.Collections.NonGeneric => 0xe2098b0b => 97
	i32 3800979733, ; 235: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 46
	i32 3817368567, ; 236: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 237: System.Security.Cryptography.dll => 0xe3df9d2b => 121
	i32 3841636137, ; 238: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 41
	i32 3842894692, ; 239: ZXing.Net.MAUI => 0xe50deb64 => 92
	i32 3844307129, ; 240: System.Net.Mail.dll => 0xe52378b9 => 110
	i32 3849253459, ; 241: System.Runtime.InteropServices.dll => 0xe56ef253 => 117
	i32 3889960447, ; 242: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 243: System.Collections.Concurrent.dll => 0xe839deed => 95
	i32 3896760992, ; 244: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 64
	i32 3928044579, ; 245: System.Xml.ReaderWriter => 0xea213423 => 128
	i32 3931092270, ; 246: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 77
	i32 3955647286, ; 247: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 56
	i32 3970018735, ; 248: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 88
	i32 3980434154, ; 249: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 250: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 251: System.Memory => 0xeff49a63 => 108
	i32 4046471985, ; 252: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 49
	i32 4073602200, ; 253: System.Threading.dll => 0xf2ce3c98 => 126
	i32 4094352644, ; 254: Microsoft.Maui.Essentials.dll => 0xf40add04 => 51
	i32 4100113165, ; 255: System.Private.Uri => 0xf462c30d => 115
	i32 4102112229, ; 256: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 257: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 258: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 40
	i32 4150914736, ; 259: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 260: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 72
	i32 4190991637, ; 261: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 53
	i32 4213026141, ; 262: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 54
	i32 4271975918, ; 263: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 264: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 265: System.Runtime.Numerics => 0xfecef6ea => 119
	i32 4278134329, ; 266: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 87
	i32 4292120959 ; 267: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 72
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [268 x i32] [
	i32 84, ; 0
	i32 59, ; 1
	i32 125, ; 2
	i32 33, ; 3
	i32 52, ; 4
	i32 117, ; 5
	i32 62, ; 6
	i32 80, ; 7
	i32 30, ; 8
	i32 31, ; 9
	i32 101, ; 10
	i32 2, ; 11
	i32 30, ; 12
	i32 55, ; 13
	i32 15, ; 14
	i32 69, ; 15
	i32 14, ; 16
	i32 125, ; 17
	i32 108, ; 18
	i32 34, ; 19
	i32 26, ; 20
	i32 98, ; 21
	i32 68, ; 22
	i32 127, ; 23
	i32 129, ; 24
	i32 114, ; 25
	i32 13, ; 26
	i32 7, ; 27
	i32 45, ; 28
	i32 42, ; 29
	i32 21, ; 30
	i32 35, ; 31
	i32 66, ; 32
	i32 19, ; 33
	i32 122, ; 34
	i32 95, ; 35
	i32 1, ; 36
	i32 16, ; 37
	i32 4, ; 38
	i32 118, ; 39
	i32 112, ; 40
	i32 105, ; 41
	i32 25, ; 42
	i32 44, ; 43
	i32 115, ; 44
	i32 104, ; 45
	i32 93, ; 46
	i32 91, ; 47
	i32 99, ; 48
	i32 53, ; 49
	i32 28, ; 50
	i32 84, ; 51
	i32 69, ; 52
	i32 98, ; 53
	i32 79, ; 54
	i32 41, ; 55
	i32 3, ; 56
	i32 56, ; 57
	i32 106, ; 58
	i32 71, ; 59
	i32 100, ; 60
	i32 89, ; 61
	i32 129, ; 62
	i32 16, ; 63
	i32 22, ; 64
	i32 76, ; 65
	i32 20, ; 66
	i32 37, ; 67
	i32 18, ; 68
	i32 2, ; 69
	i32 67, ; 70
	i32 107, ; 71
	i32 32, ; 72
	i32 79, ; 73
	i32 63, ; 74
	i32 0, ; 75
	i32 6, ; 76
	i32 96, ; 77
	i32 105, ; 78
	i32 57, ; 79
	i32 45, ; 80
	i32 96, ; 81
	i32 104, ; 82
	i32 10, ; 83
	i32 5, ; 84
	i32 124, ; 85
	i32 25, ; 86
	i32 73, ; 87
	i32 82, ; 88
	i32 36, ; 89
	i32 65, ; 90
	i32 109, ; 91
	i32 124, ; 92
	i32 120, ; 93
	i32 83, ; 94
	i32 111, ; 95
	i32 121, ; 96
	i32 61, ; 97
	i32 23, ; 98
	i32 1, ; 99
	i32 103, ; 100
	i32 80, ; 101
	i32 42, ; 102
	i32 132, ; 103
	i32 17, ; 104
	i32 68, ; 105
	i32 9, ; 106
	i32 73, ; 107
	i32 89, ; 108
	i32 83, ; 109
	i32 77, ; 110
	i32 43, ; 111
	i32 29, ; 112
	i32 26, ; 113
	i32 106, ; 114
	i32 8, ; 115
	i32 86, ; 116
	i32 97, ; 117
	i32 38, ; 118
	i32 5, ; 119
	i32 71, ; 120
	i32 0, ; 121
	i32 116, ; 122
	i32 70, ; 123
	i32 4, ; 124
	i32 103, ; 125
	i32 120, ; 126
	i32 113, ; 127
	i32 102, ; 128
	i32 85, ; 129
	i32 50, ; 130
	i32 12, ; 131
	i32 44, ; 132
	i32 43, ; 133
	i32 114, ; 134
	i32 90, ; 135
	i32 109, ; 136
	i32 14, ; 137
	i32 39, ; 138
	i32 8, ; 139
	i32 78, ; 140
	i32 110, ; 141
	i32 48, ; 142
	i32 18, ; 143
	i32 130, ; 144
	i32 111, ; 145
	i32 128, ; 146
	i32 38, ; 147
	i32 13, ; 148
	i32 127, ; 149
	i32 10, ; 150
	i32 102, ; 151
	i32 131, ; 152
	i32 47, ; 153
	i32 11, ; 154
	i32 122, ; 155
	i32 20, ; 156
	i32 90, ; 157
	i32 116, ; 158
	i32 94, ; 159
	i32 65, ; 160
	i32 15, ; 161
	i32 118, ; 162
	i32 119, ; 163
	i32 55, ; 164
	i32 57, ; 165
	i32 21, ; 166
	i32 49, ; 167
	i32 50, ; 168
	i32 81, ; 169
	i32 27, ; 170
	i32 52, ; 171
	i32 6, ; 172
	i32 63, ; 173
	i32 19, ; 174
	i32 85, ; 175
	i32 81, ; 176
	i32 51, ; 177
	i32 36, ; 178
	i32 130, ; 179
	i32 82, ; 180
	i32 113, ; 181
	i32 101, ; 182
	i32 60, ; 183
	i32 67, ; 184
	i32 94, ; 185
	i32 58, ; 186
	i32 60, ; 187
	i32 87, ; 188
	i32 34, ; 189
	i32 58, ; 190
	i32 74, ; 191
	i32 88, ; 192
	i32 132, ; 193
	i32 99, ; 194
	i32 12, ; 195
	i32 75, ; 196
	i32 91, ; 197
	i32 126, ; 198
	i32 86, ; 199
	i32 61, ; 200
	i32 92, ; 201
	i32 7, ; 202
	i32 112, ; 203
	i32 66, ; 204
	i32 76, ; 205
	i32 24, ; 206
	i32 123, ; 207
	i32 64, ; 208
	i32 131, ; 209
	i32 78, ; 210
	i32 3, ; 211
	i32 40, ; 212
	i32 46, ; 213
	i32 11, ; 214
	i32 100, ; 215
	i32 133, ; 216
	i32 24, ; 217
	i32 23, ; 218
	i32 123, ; 219
	i32 48, ; 220
	i32 31, ; 221
	i32 107, ; 222
	i32 70, ; 223
	i32 28, ; 224
	i32 75, ; 225
	i32 39, ; 226
	i32 133, ; 227
	i32 59, ; 228
	i32 33, ; 229
	i32 74, ; 230
	i32 54, ; 231
	i32 93, ; 232
	i32 62, ; 233
	i32 97, ; 234
	i32 46, ; 235
	i32 35, ; 236
	i32 121, ; 237
	i32 41, ; 238
	i32 92, ; 239
	i32 110, ; 240
	i32 117, ; 241
	i32 32, ; 242
	i32 95, ; 243
	i32 64, ; 244
	i32 128, ; 245
	i32 77, ; 246
	i32 56, ; 247
	i32 88, ; 248
	i32 27, ; 249
	i32 9, ; 250
	i32 108, ; 251
	i32 49, ; 252
	i32 126, ; 253
	i32 51, ; 254
	i32 115, ; 255
	i32 22, ; 256
	i32 17, ; 257
	i32 40, ; 258
	i32 29, ; 259
	i32 72, ; 260
	i32 53, ; 261
	i32 54, ; 262
	i32 47, ; 263
	i32 37, ; 264
	i32 119, ; 265
	i32 87, ; 266
	i32 72 ; 267
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
