; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [128 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [256 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 82
	i32 40744412, ; 1: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 57
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 119
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 51
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 111
	i32 165246403, ; 6: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 60
	i32 182336117, ; 7: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 78
	i32 195452805, ; 8: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 9: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 10: System.ComponentModel => 0xc38ff48 => 95
	i32 280992041, ; 11: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 53
	i32 336156722, ; 14: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 67
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 119
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 102
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 20: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 92
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 66
	i32 456227837, ; 23: System.Web.HttpUtility.dll => 0x1b317bfd => 121
	i32 469710990, ; 24: System.dll => 0x1bff388e => 123
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 108
	i32 500358224, ; 26: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 45
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 42
	i32 592146354, ; 30: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 31: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 64
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 34: System.Text.Encodings.Web.dll => 0x27787397 => 116
	i32 672442732, ; 35: System.Collections.Concurrent => 0x2814a96c => 89
	i32 688181140, ; 36: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 37: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 38: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 39: System.Runtime.Loader.dll => 0x2b15ed29 => 112
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 106
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 99
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 44
	i32 823281589, ; 44: System.Private.Uri.dll => 0x311247b5 => 109
	i32 830298997, ; 45: System.IO.Compression.Brotli => 0x317d5b75 => 98
	i32 839353180, ; 46: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 87
	i32 865465478, ; 47: zxing.dll => 0x3395f486 => 85
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 93
	i32 926902833, ; 49: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 50: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 82
	i32 967690846, ; 51: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 67
	i32 992768348, ; 52: System.Collections.dll => 0x3b2c715c => 92
	i32 1012816738, ; 53: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 77
	i32 1028951442, ; 54: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 41
	i32 1029334545, ; 55: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 56: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 54
	i32 1044663988, ; 57: System.Linq.Expressions.dll => 0x3e444eb4 => 100
	i32 1052210849, ; 58: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 69
	i32 1082857460, ; 59: System.ComponentModel.TypeConverter => 0x408b17f4 => 94
	i32 1084122840, ; 60: Xamarin.Kotlin.StdLib => 0x409e66d8 => 83
	i32 1098259244, ; 61: System => 0x41761b2c => 123
	i32 1118262833, ; 62: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 63: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 64: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 74
	i32 1203215381, ; 65: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 66: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1234928153, ; 67: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 68: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 69: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 65
	i32 1324164729, ; 70: System.Linq => 0x4eed2679 => 101
	i32 1373134921, ; 71: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 72: Xamarin.AndroidX.SavedState => 0x52114ed3 => 77
	i32 1406073936, ; 73: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 61
	i32 1430672901, ; 74: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 75: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 76: System.Collections.Immutable.dll => 0x5718a9ef => 90
	i32 1462112819, ; 77: System.IO.Compression.dll => 0x57261233 => 99
	i32 1469204771, ; 78: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 55
	i32 1470490898, ; 79: Microsoft.Extensions.Primitives => 0x57a5e912 => 45
	i32 1479771757, ; 80: System.Collections.Immutable => 0x5833866d => 90
	i32 1480492111, ; 81: System.IO.Compression.Brotli.dll => 0x583e844f => 98
	i32 1493001747, ; 82: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 83: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 84: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 118
	i32 1551623176, ; 85: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 86: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 71
	i32 1624863272, ; 87: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 80
	i32 1634654947, ; 88: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 63
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 103
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 118
	i32 1657153582, ; 92: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 81
	i32 1677501392, ; 94: System.Net.Primitives.dll => 0x63fca3d0 => 105
	i32 1679769178, ; 95: System.Security.Cryptography => 0x641f3e5a => 115
	i32 1729485958, ; 96: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 59
	i32 1736233607, ; 97: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 98: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 99: System.Diagnostics.TraceSource.dll => 0x69239124 => 97
	i32 1766324549, ; 100: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 78
	i32 1770582343, ; 101: Microsoft.Extensions.Logging.dll => 0x6988f147 => 42
	i32 1780572499, ; 102: Mono.Android.Runtime.dll => 0x6a216153 => 126
	i32 1782862114, ; 103: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 104: Xamarin.AndroidX.Fragment => 0x6a96652d => 66
	i32 1793755602, ; 105: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 106: Xamarin.AndroidX.Loader => 0x6bcd3296 => 71
	i32 1813058853, ; 107: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 83
	i32 1813201214, ; 108: Xamarin.Google.Android.Material => 0x6c13413e => 81
	i32 1818569960, ; 109: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 75
	i32 1828688058, ; 110: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 43
	i32 1842015223, ; 111: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 112: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 113: System.Linq.Expressions => 0x6ec71a65 => 100
	i32 1875935024, ; 114: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 115: System.Collections.NonGeneric.dll => 0x71dc7c8b => 91
	i32 1968388702, ; 116: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 2003115576, ; 117: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 118: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 69
	i32 2025202353, ; 119: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 120: System.Private.Xml => 0x79eb68ee => 110
	i32 2055257422, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 68
	i32 2066184531, ; 122: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 123: System.Diagnostics.TraceSource => 0x7b6f419e => 97
	i32 2079903147, ; 124: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 125: System.Numerics.Vectors => 0x7c9bf920 => 107
	i32 2127167465, ; 126: System.Console => 0x7ec9ffe9 => 96
	i32 2159891885, ; 127: Microsoft.Maui => 0x80bd55ad => 49
	i32 2169148018, ; 128: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 129: Microsoft.Extensions.Options.dll => 0x820d22b3 => 44
	i32 2192057212, ; 130: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 43
	i32 2193016926, ; 131: System.ObjectModel.dll => 0x82b6c85e => 108
	i32 2201107256, ; 132: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 84
	i32 2201231467, ; 133: System.Net.Http => 0x8334206b => 103
	i32 2207618523, ; 134: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 135: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2270573516, ; 136: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 137: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 76
	i32 2298471582, ; 138: System.Net.Mail => 0x88ffe49e => 104
	i32 2303942373, ; 139: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 140: System.Private.CoreLib.dll => 0x896b7878 => 124
	i32 2353062107, ; 141: System.Net.Primitives => 0x8c40e0db => 105
	i32 2368005991, ; 142: System.Xml.ReaderWriter.dll => 0x8d24e767 => 122
	i32 2371007202, ; 143: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2395872292, ; 144: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 145: System.Web.HttpUtility => 0x8f24faee => 121
	i32 2427813419, ; 146: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 147: System.Console.dll => 0x912896e5 => 96
	i32 2475788418, ; 148: Java.Interop.dll => 0x93918882 => 125
	i32 2480646305, ; 149: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2550873716, ; 150: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 151: System.Text.Encodings.Web => 0x9930ee42 => 116
	i32 2593496499, ; 152: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 153: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 84
	i32 2617129537, ; 154: System.Private.Xml.dll => 0x9bfe3a41 => 110
	i32 2618696925, ; 155: MetanetA_MobileApp.dll => 0x9c1624dd => 88
	i32 2620871830, ; 156: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 63
	i32 2626831493, ; 157: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 158: System.Runtime.Loader => 0x9ec4cf01 => 112
	i32 2724373263, ; 159: System.Runtime.Numerics.dll => 0xa262a30f => 113
	i32 2732626843, ; 160: Xamarin.AndroidX.Activity => 0xa2e0939b => 53
	i32 2737747696, ; 161: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 55
	i32 2752995522, ; 162: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 163: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 48
	i32 2764765095, ; 164: Microsoft.Maui.dll => 0xa4caf7a7 => 49
	i32 2778768386, ; 165: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 79
	i32 2785988530, ; 166: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 167: Microsoft.Maui.Graphics => 0xa7008e0b => 51
	i32 2806116107, ; 168: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 169: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 61
	i32 2831556043, ; 170: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 171: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 79
	i32 2861189240, ; 172: Microsoft.Maui.Essentials => 0xaa8a4878 => 50
	i32 2868488919, ; 173: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 174: System.Private.CoreLib => 0xad6f1e8a => 124
	i32 2916838712, ; 175: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 80
	i32 2919462931, ; 176: System.Numerics.Vectors.dll => 0xae037813 => 107
	i32 2959614098, ; 177: System.ComponentModel.dll => 0xb0682092 => 95
	i32 2965157864, ; 178: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 58
	i32 2978675010, ; 179: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 65
	i32 2987996059, ; 180: MetanetA_MobileApp => 0xb219339b => 88
	i32 2991449226, ; 181: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 56
	i32 3000842441, ; 182: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 58
	i32 3038032645, ; 183: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 184: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 56
	i32 3057625584, ; 185: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 72
	i32 3059408633, ; 186: Mono.Android.Runtime => 0xb65adef9 => 126
	i32 3059793426, ; 187: System.ComponentModel.Primitives => 0xb660be12 => 93
	i32 3077302341, ; 188: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 189: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 73
	i32 3215347189, ; 190: zxing => 0xbfa64df5 => 85
	i32 3220365878, ; 191: System.Threading => 0xbff2e236 => 120
	i32 3258312781, ; 192: Xamarin.AndroidX.CardView => 0xc235e84d => 59
	i32 3286373667, ; 193: ZXing.Net.MAUI.dll => 0xc3e21523 => 86
	i32 3305363605, ; 194: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 195: System.Net.Requests.dll => 0xc5b097e4 => 106
	i32 3317135071, ; 196: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 64
	i32 3346324047, ; 197: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 74
	i32 3357674450, ; 198: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 199: System.Text.Json => 0xc82afec1 => 117
	i32 3362522851, ; 200: Xamarin.AndroidX.Core => 0xc86c06e3 => 62
	i32 3366347497, ; 201: Java.Interop => 0xc8a662e9 => 125
	i32 3374999561, ; 202: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 76
	i32 3381016424, ; 203: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 204: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 40
	i32 3452344032, ; 205: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 46
	i32 3463511458, ; 206: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 207: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 94
	i32 3476120550, ; 208: Mono.Android => 0xcf3163e6 => 127
	i32 3479583265, ; 209: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 210: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 211: System.Text.Json.dll => 0xcfbaacae => 117
	i32 3580758918, ; 212: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 213: System.Linq.dll => 0xd715a361 => 101
	i32 3641597786, ; 214: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 68
	i32 3643446276, ; 215: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 216: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 73
	i32 3657292374, ; 217: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3672681054, ; 218: Mono.Android.dll => 0xdae8aa5e => 127
	i32 3676461095, ; 219: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 57
	i32 3697841164, ; 220: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 221: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 72
	i32 3748608112, ; 222: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 52
	i32 3751582913, ; 223: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 87
	i32 3786282454, ; 224: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 60
	i32 3792276235, ; 225: System.Collections.NonGeneric => 0xe2098b0b => 91
	i32 3800979733, ; 226: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 46
	i32 3817368567, ; 227: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 228: System.Security.Cryptography.dll => 0xe3df9d2b => 115
	i32 3841636137, ; 229: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 41
	i32 3842894692, ; 230: ZXing.Net.MAUI => 0xe50deb64 => 86
	i32 3844307129, ; 231: System.Net.Mail.dll => 0xe52378b9 => 104
	i32 3849253459, ; 232: System.Runtime.InteropServices.dll => 0xe56ef253 => 111
	i32 3889960447, ; 233: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 234: System.Collections.Concurrent.dll => 0xe839deed => 89
	i32 3896760992, ; 235: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 62
	i32 3928044579, ; 236: System.Xml.ReaderWriter => 0xea213423 => 122
	i32 3931092270, ; 237: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 75
	i32 3955647286, ; 238: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 54
	i32 3980434154, ; 239: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 240: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 241: System.Memory => 0xeff49a63 => 102
	i32 4046471985, ; 242: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 48
	i32 4073602200, ; 243: System.Threading.dll => 0xf2ce3c98 => 120
	i32 4094352644, ; 244: Microsoft.Maui.Essentials.dll => 0xf40add04 => 50
	i32 4100113165, ; 245: System.Private.Uri => 0xf462c30d => 109
	i32 4102112229, ; 246: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 247: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 248: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 40
	i32 4150914736, ; 249: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 250: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 70
	i32 4213026141, ; 251: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 52
	i32 4271975918, ; 252: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 253: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 254: System.Runtime.Numerics => 0xfecef6ea => 113
	i32 4292120959 ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 70
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [256 x i32] [
	i32 82, ; 0
	i32 57, ; 1
	i32 119, ; 2
	i32 33, ; 3
	i32 51, ; 4
	i32 111, ; 5
	i32 60, ; 6
	i32 78, ; 7
	i32 30, ; 8
	i32 31, ; 9
	i32 95, ; 10
	i32 2, ; 11
	i32 30, ; 12
	i32 53, ; 13
	i32 15, ; 14
	i32 67, ; 15
	i32 14, ; 16
	i32 119, ; 17
	i32 102, ; 18
	i32 34, ; 19
	i32 26, ; 20
	i32 92, ; 21
	i32 66, ; 22
	i32 121, ; 23
	i32 123, ; 24
	i32 108, ; 25
	i32 13, ; 26
	i32 7, ; 27
	i32 45, ; 28
	i32 42, ; 29
	i32 21, ; 30
	i32 35, ; 31
	i32 64, ; 32
	i32 19, ; 33
	i32 116, ; 34
	i32 89, ; 35
	i32 1, ; 36
	i32 16, ; 37
	i32 4, ; 38
	i32 112, ; 39
	i32 106, ; 40
	i32 99, ; 41
	i32 25, ; 42
	i32 44, ; 43
	i32 109, ; 44
	i32 98, ; 45
	i32 87, ; 46
	i32 85, ; 47
	i32 93, ; 48
	i32 28, ; 49
	i32 82, ; 50
	i32 67, ; 51
	i32 92, ; 52
	i32 77, ; 53
	i32 41, ; 54
	i32 3, ; 55
	i32 54, ; 56
	i32 100, ; 57
	i32 69, ; 58
	i32 94, ; 59
	i32 83, ; 60
	i32 123, ; 61
	i32 16, ; 62
	i32 22, ; 63
	i32 74, ; 64
	i32 20, ; 65
	i32 37, ; 66
	i32 18, ; 67
	i32 2, ; 68
	i32 65, ; 69
	i32 101, ; 70
	i32 32, ; 71
	i32 77, ; 72
	i32 61, ; 73
	i32 0, ; 74
	i32 6, ; 75
	i32 90, ; 76
	i32 99, ; 77
	i32 55, ; 78
	i32 45, ; 79
	i32 90, ; 80
	i32 98, ; 81
	i32 10, ; 82
	i32 5, ; 83
	i32 118, ; 84
	i32 25, ; 85
	i32 71, ; 86
	i32 80, ; 87
	i32 36, ; 88
	i32 63, ; 89
	i32 103, ; 90
	i32 118, ; 91
	i32 114, ; 92
	i32 81, ; 93
	i32 105, ; 94
	i32 115, ; 95
	i32 59, ; 96
	i32 23, ; 97
	i32 1, ; 98
	i32 97, ; 99
	i32 78, ; 100
	i32 42, ; 101
	i32 126, ; 102
	i32 17, ; 103
	i32 66, ; 104
	i32 9, ; 105
	i32 71, ; 106
	i32 83, ; 107
	i32 81, ; 108
	i32 75, ; 109
	i32 43, ; 110
	i32 29, ; 111
	i32 26, ; 112
	i32 100, ; 113
	i32 8, ; 114
	i32 91, ; 115
	i32 38, ; 116
	i32 5, ; 117
	i32 69, ; 118
	i32 0, ; 119
	i32 110, ; 120
	i32 68, ; 121
	i32 4, ; 122
	i32 97, ; 123
	i32 114, ; 124
	i32 107, ; 125
	i32 96, ; 126
	i32 49, ; 127
	i32 12, ; 128
	i32 44, ; 129
	i32 43, ; 130
	i32 108, ; 131
	i32 84, ; 132
	i32 103, ; 133
	i32 14, ; 134
	i32 39, ; 135
	i32 8, ; 136
	i32 76, ; 137
	i32 104, ; 138
	i32 18, ; 139
	i32 124, ; 140
	i32 105, ; 141
	i32 122, ; 142
	i32 38, ; 143
	i32 13, ; 144
	i32 121, ; 145
	i32 10, ; 146
	i32 96, ; 147
	i32 125, ; 148
	i32 47, ; 149
	i32 11, ; 150
	i32 116, ; 151
	i32 20, ; 152
	i32 84, ; 153
	i32 110, ; 154
	i32 88, ; 155
	i32 63, ; 156
	i32 15, ; 157
	i32 112, ; 158
	i32 113, ; 159
	i32 53, ; 160
	i32 55, ; 161
	i32 21, ; 162
	i32 48, ; 163
	i32 49, ; 164
	i32 79, ; 165
	i32 27, ; 166
	i32 51, ; 167
	i32 6, ; 168
	i32 61, ; 169
	i32 19, ; 170
	i32 79, ; 171
	i32 50, ; 172
	i32 36, ; 173
	i32 124, ; 174
	i32 80, ; 175
	i32 107, ; 176
	i32 95, ; 177
	i32 58, ; 178
	i32 65, ; 179
	i32 88, ; 180
	i32 56, ; 181
	i32 58, ; 182
	i32 34, ; 183
	i32 56, ; 184
	i32 72, ; 185
	i32 126, ; 186
	i32 93, ; 187
	i32 12, ; 188
	i32 73, ; 189
	i32 85, ; 190
	i32 120, ; 191
	i32 59, ; 192
	i32 86, ; 193
	i32 7, ; 194
	i32 106, ; 195
	i32 64, ; 196
	i32 74, ; 197
	i32 24, ; 198
	i32 117, ; 199
	i32 62, ; 200
	i32 125, ; 201
	i32 76, ; 202
	i32 3, ; 203
	i32 40, ; 204
	i32 46, ; 205
	i32 11, ; 206
	i32 94, ; 207
	i32 127, ; 208
	i32 24, ; 209
	i32 23, ; 210
	i32 117, ; 211
	i32 31, ; 212
	i32 101, ; 213
	i32 68, ; 214
	i32 28, ; 215
	i32 73, ; 216
	i32 39, ; 217
	i32 127, ; 218
	i32 57, ; 219
	i32 33, ; 220
	i32 72, ; 221
	i32 52, ; 222
	i32 87, ; 223
	i32 60, ; 224
	i32 91, ; 225
	i32 46, ; 226
	i32 35, ; 227
	i32 115, ; 228
	i32 41, ; 229
	i32 86, ; 230
	i32 104, ; 231
	i32 111, ; 232
	i32 32, ; 233
	i32 89, ; 234
	i32 62, ; 235
	i32 122, ; 236
	i32 75, ; 237
	i32 54, ; 238
	i32 27, ; 239
	i32 9, ; 240
	i32 102, ; 241
	i32 48, ; 242
	i32 120, ; 243
	i32 50, ; 244
	i32 109, ; 245
	i32 22, ; 246
	i32 17, ; 247
	i32 40, ; 248
	i32 29, ; 249
	i32 70, ; 250
	i32 52, ; 251
	i32 47, ; 252
	i32 37, ; 253
	i32 113, ; 254
	i32 70 ; 255
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
