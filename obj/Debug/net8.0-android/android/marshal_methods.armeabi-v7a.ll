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

@assembly_image_cache = dso_local local_unnamed_addr global [351 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [696 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 241
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 291
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 40744412, ; 7: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 212
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 144
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 342
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 259
	i32 103834273, ; 15: Xamarin.Firebase.Annotations.dll => 0x63062a1 => 271
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 259
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 302
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 147669188, ; 21: Plugin.Firebase.Core.dll => 0x8cd40c4 => 194
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 215
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 26: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 261
	i32 184328833, ; 27: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 28: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 339
	i32 199333315, ; 29: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 340
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 209
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 235
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 37: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 218
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 237
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 234
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 311
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 339
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 200
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 324
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 236
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 323
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 347
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 335
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 219
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 232
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 68: System.dll => 0x1bff388e => 163
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 234
	i32 485140951, ; 70: Xamarin.Google.Android.DataTransport.TransportRuntime => 0x1ceaa9d7 => 285
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 247
	i32 495452658, ; 72: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x1d8801f2 => 285
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 74: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 322
	i32 503918385, ; 75: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 316
	i32 507148113, ; 76: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 283
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 184
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 302
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 180
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 542030372, ; 83: Xamarin.GooglePlayServices.Stats => 0x204eba24 => 296
	i32 545304856, ; 84: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 85: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 87: Jsr305Binding => 0x213954e7 => 288
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 270
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 90: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 330
	i32 597488923, ; 91: CommunityToolkit.Maui => 0x239cf51b => 172
	i32 601371474, ; 92: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 93: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 94: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 224
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 328
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 230
	i32 643868501, ; 98: System.Net => 0x2660a755 => 80
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 266
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 207
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 104: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 310
	i32 690569205, ; 105: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 106: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 304
	i32 693804605, ; 107: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 108: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 109: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 299
	i32 700358131, ; 110: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 111: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 325
	i32 709557578, ; 112: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 313
	i32 720511267, ; 113: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 303
	i32 722857257, ; 114: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 197
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 334
	i32 782533833, ; 122: Xamarin.Google.AutoValue.Annotations.dll => 0x2ea484c9 => 287
	i32 789151979, ; 123: Microsoft.Extensions.Options => 0x2f0980eb => 183
	i32 790371945, ; 124: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 225
	i32 804715423, ; 125: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 126: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 239
	i32 823281589, ; 127: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 128: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 129: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 70
	i32 839353180, ; 131: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 308
	i32 843511501, ; 132: Xamarin.AndroidX.Print => 0x3246f6cd => 252
	i32 846667644, ; 133: Xamarin.Firebase.Installations.dll => 0x32771f7c => 279
	i32 856800933, ; 134: Plugin.Firebase.CloudMessaging.dll => 0x3311bea5 => 193
	i32 865465478, ; 135: zxing.dll => 0x3395f486 => 306
	i32 873119928, ; 136: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 137: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 138: System.Net.Http.Json => 0x3463c971 => 62
	i32 882434999, ; 139: Xamarin.Firebase.Installations.InterOp.dll => 0x3498e3b7 => 280
	i32 904024072, ; 140: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 908888060, ; 141: Microsoft.Maui.Maps => 0x362c87fc => 192
	i32 911108515, ; 142: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 143: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 337
	i32 928116545, ; 144: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 291
	i32 952186615, ; 145: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 146: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 303
	i32 965247473, ; 147: Plugin.Firebase.Core => 0x398881f1 => 194
	i32 966729478, ; 148: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 289
	i32 967690846, ; 149: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 236
	i32 975236339, ; 150: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 151: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 152: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 153: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 154: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 155: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 996733531, ; 156: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3b68f25b => 284
	i32 1001831731, ; 157: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 158: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 256
	i32 1019214401, ; 159: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 160: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 179
	i32 1029334545, ; 161: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 312
	i32 1031528504, ; 162: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 290
	i32 1035644815, ; 163: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 205
	i32 1036359102, ; 164: Xamarin.GooglePlayServices.CloudMessaging.dll => 0x3dc595be => 294
	i32 1036536393, ; 165: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 166: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 167: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 243
	i32 1061503568, ; 168: Xamarin.Google.AutoValue.Annotations => 0x3f454250 => 287
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 171: Xamarin.Kotlin.StdLib => 0x409e66d8 => 300
	i32 1098259244, ; 172: System => 0x41761b2c => 163
	i32 1118262833, ; 173: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 325
	i32 1121599056, ; 174: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 242
	i32 1127624469, ; 175: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 182
	i32 1141947663, ; 176: Xamarin.Firebase.Measurement.Connector.dll => 0x4410bd0f => 281
	i32 1149092582, ; 177: Xamarin.AndroidX.Window => 0x447dc2e6 => 269
	i32 1168523401, ; 178: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 331
	i32 1170634674, ; 179: System.Web.dll => 0x45c677b2 => 152
	i32 1175144683, ; 180: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 265
	i32 1178241025, ; 181: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 250
	i32 1203215381, ; 182: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 329
	i32 1204270330, ; 183: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 207
	i32 1208641965, ; 184: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 185: CommunityToolkit.Mvvm => 0x4868cc7b => 174
	i32 1219128291, ; 186: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 187: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 327
	i32 1243150071, ; 188: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 270
	i32 1253011324, ; 189: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 190: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 311
	i32 1264511973, ; 191: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 260
	i32 1267360935, ; 192: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 264
	i32 1273260888, ; 193: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 216
	i32 1275534314, ; 194: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 304
	i32 1278448581, ; 195: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 204
	i32 1293217323, ; 196: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 227
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 269
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 60
	i32 1333047053, ; 200: Xamarin.Firebase.Common => 0x4f74af0d => 272
	i32 1335329327, ; 201: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 202: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 203: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 341
	i32 1376866003, ; 204: Xamarin.AndroidX.SavedState => 0x52114ed3 => 256
	i32 1379779777, ; 205: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1379897097, ; 206: Xamarin.JavaX.Inject => 0x523f8f09 => 298
	i32 1402170036, ; 207: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 208: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 220
	i32 1408764838, ; 209: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 210: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 211: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 212: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 309
	i32 1434145427, ; 213: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 214: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 289
	i32 1439761251, ; 215: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 216: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 217: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 218: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 219: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 220: es\Microsoft.Maui.Controls.resources => 0x57152abe => 315
	i32 1461234159, ; 221: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 222: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 223: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 224: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 206
	i32 1470490898, ; 225: Microsoft.Extensions.Primitives => 0x57a5e912 => 184
	i32 1479771757, ; 226: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 227: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 228: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 229: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 257
	i32 1493001747, ; 230: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 319
	i32 1514721132, ; 231: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 314
	i32 1531040989, ; 232: Xamarin.Firebase.Iid.Interop.dll => 0x5b41d4dd => 278
	i32 1536373174, ; 233: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 234: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 235: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 236: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 237: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 334
	i32 1565862583, ; 238: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 239: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 240: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 241: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1582372066, ; 242: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 226
	i32 1592978981, ; 243: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 244: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 290
	i32 1601112923, ; 245: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1603525486, ; 246: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 343
	i32 1604827217, ; 247: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 248: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 249: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 246
	i32 1622358360, ; 250: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 251: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 268
	i32 1634654947, ; 252: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 173
	i32 1635184631, ; 253: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 230
	i32 1636350590, ; 254: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 223
	i32 1639515021, ; 255: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 256: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 257: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 258: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 259: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 262
	i32 1658251792, ; 260: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 286
	i32 1670060433, ; 261: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 218
	i32 1675553242, ; 262: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 263: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 264: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 265: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 266: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 267: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 268: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 301
	i32 1701541528, ; 269: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 270: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 239
	i32 1726116996, ; 271: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 272: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 273: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 214
	i32 1736233607, ; 274: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 332
	i32 1743415430, ; 275: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 310
	i32 1744735666, ; 276: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746316138, ; 277: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 278: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 279: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 280: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 281: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 282: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 261
	i32 1770582343, ; 283: Microsoft.Extensions.Logging.dll => 0x6988f147 => 180
	i32 1776026572, ; 284: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 285: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 286: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1782862114, ; 287: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 326
	i32 1788241197, ; 288: Xamarin.AndroidX.Fragment => 0x6a96652d => 232
	i32 1793755602, ; 289: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 318
	i32 1808609942, ; 290: Xamarin.AndroidX.Loader => 0x6bcd3296 => 246
	i32 1813058853, ; 291: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 300
	i32 1813201214, ; 292: Xamarin.Google.Android.Material => 0x6c13413e => 286
	i32 1818569960, ; 293: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 251
	i32 1818787751, ; 294: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 295: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 296: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1827303595, ; 297: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 345
	i32 1828688058, ; 298: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 181
	i32 1842015223, ; 299: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 338
	i32 1847515442, ; 300: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 197
	i32 1853025655, ; 301: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 335
	i32 1858542181, ; 302: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 303: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 304: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 317
	i32 1876173635, ; 305: Xamarin.Firebase.Encoders.Proto => 0x6fd42343 => 277
	i32 1879696579, ; 306: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 307: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 208
	i32 1885918049, ; 308: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 345
	i32 1888955245, ; 309: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 310: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 311: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 312: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1908813208, ; 313: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 293
	i32 1910275211, ; 314: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1933215285, ; 315: Xamarin.Firebase.Messaging.dll => 0x733a8635 => 282
	i32 1939592360, ; 316: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 317: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 318: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 258
	i32 1968388702, ; 319: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 176
	i32 1983156543, ; 320: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 301
	i32 1985761444, ; 321: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 199
	i32 2003115576, ; 322: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 314
	i32 2011961780, ; 323: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 324: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 243
	i32 2025202353, ; 325: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 309
	i32 2031763787, ; 326: Xamarin.Android.Glide => 0x791a414b => 196
	i32 2045470958, ; 327: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 328: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 238
	i32 2060060697, ; 329: System.Windows.dll => 0x7aca0819 => 153
	i32 2066184531, ; 330: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 313
	i32 2070888862, ; 331: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 332: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 333: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2117912485, ; 334: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 0x7e3cc7a5 => 346
	i32 2124230737, ; 335: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x7e9d3051 => 284
	i32 2127167465, ; 336: System.Console => 0x7ec9ffe9 => 20
	i32 2129483829, ; 337: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 292
	i32 2142473426, ; 338: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 339: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 340: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 341: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 342: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 321
	i32 2174878672, ; 343: Xamarin.Firebase.Annotations => 0x81a203d0 => 271
	i32 2181898931, ; 344: Microsoft.Extensions.Options.dll => 0x820d22b3 => 183
	i32 2192057212, ; 345: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 181
	i32 2193016926, ; 346: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 347: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 305
	i32 2201231467, ; 348: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 349: it\Microsoft.Maui.Controls.resources => 0x839595db => 323
	i32 2217644978, ; 350: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 265
	i32 2222056684, ; 351: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 352: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 247
	i32 2252106437, ; 353: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2256313426, ; 354: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 355: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 356: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 177
	i32 2267999099, ; 357: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 198
	i32 2270573516, ; 358: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 317
	i32 2279755925, ; 359: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 254
	i32 2293034957, ; 360: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 361: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 362: System.Net.Mail => 0x88ffe49e => 65
	i32 2303073227, ; 363: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 187
	i32 2303942373, ; 364: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 327
	i32 2305521784, ; 365: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 366: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 202
	i32 2320631194, ; 367: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2340441535, ; 368: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 369: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 370: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 371: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2371007202, ; 372: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 176
	i32 2378619854, ; 373: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 374: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 375: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 322
	i32 2401565422, ; 376: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403452196, ; 377: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 229
	i32 2409983638, ; 378: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 344
	i32 2421380589, ; 379: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2423080555, ; 380: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 216
	i32 2427813419, ; 381: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 319
	i32 2435356389, ; 382: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 383: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 384: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 385: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 386: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 387: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 219
	i32 2471841756, ; 388: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 389: Java.Interop.dll => 0x93918882 => 167
	i32 2480646305, ; 390: Microsoft.Maui.Controls => 0x93dba8a1 => 186
	i32 2483661569, ; 391: Xamarin.Firebase.Measurement.Connector => 0x9409ab01 => 281
	i32 2483742551, ; 392: Xamarin.Firebase.Messaging => 0x940ae757 => 282
	i32 2483903535, ; 393: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 394: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2486410006, ; 395: Xamarin.GooglePlayServices.CloudMessaging => 0x94339b16 => 294
	i32 2490993605, ; 396: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 397: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 398: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 241
	i32 2522472828, ; 399: Xamarin.Android.Glide.dll => 0x9659e17c => 196
	i32 2538310050, ; 400: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 401: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 320
	i32 2562349572, ; 402: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 403: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2581783588, ; 404: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 242
	i32 2581819634, ; 405: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 264
	i32 2585220780, ; 406: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 407: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 408: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2593496499, ; 409: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 329
	i32 2605712449, ; 410: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 305
	i32 2615233544, ; 411: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 233
	i32 2616218305, ; 412: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 182
	i32 2617129537, ; 413: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618696925, ; 414: MetanetA_MobileApp.dll => 0x9c1624dd => 0
	i32 2618712057, ; 415: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620111890, ; 416: Xamarin.Firebase.Encoders.dll => 0x9c2bbc12 => 275
	i32 2620871830, ; 417: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 223
	i32 2623491480, ; 418: Xamarin.Firebase.Installations.InterOp => 0x9c5f4d98 => 280
	i32 2624644809, ; 419: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 228
	i32 2626831493, ; 420: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 324
	i32 2627185994, ; 421: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 422: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 423: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 237
	i32 2639764100, ; 424: Xamarin.Firebase.Encoders => 0x9d579a84 => 275
	i32 2663391936, ; 425: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 198
	i32 2663698177, ; 426: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 427: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 428: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 429: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 430: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 431: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 432: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 262
	i32 2715334215, ; 433: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 434: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 435: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 436: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 437: Xamarin.AndroidX.Activity => 0xa2e0939b => 200
	i32 2735172069, ; 438: System.Threading.Channels => 0xa30769e5 => 138
	i32 2737747696, ; 439: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 206
	i32 2740948882, ; 440: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 441: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 442: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 330
	i32 2758225723, ; 443: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 444: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 445: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 446: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 299
	i32 2778768386, ; 447: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 267
	i32 2779977773, ; 448: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 255
	i32 2785988530, ; 449: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 336
	i32 2788224221, ; 450: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 233
	i32 2801831435, ; 451: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 452: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2804607052, ; 453: Xamarin.Firebase.Components.dll => 0xa72ae84c => 273
	i32 2806116107, ; 454: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 315
	i32 2810250172, ; 455: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 220
	i32 2819470561, ; 456: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 457: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 458: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 255
	i32 2824502124, ; 459: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 460: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 328
	i32 2838993487, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 244
	i32 2847418871, ; 462: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 292
	i32 2849599387, ; 463: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 464: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 267
	i32 2855708567, ; 465: Xamarin.AndroidX.Transition => 0xaa36a797 => 263
	i32 2861098320, ; 466: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 467: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2868488919, ; 468: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 173
	i32 2870099610, ; 469: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 201
	i32 2875164099, ; 470: Jsr305Binding.dll => 0xab5f85c3 => 288
	i32 2875220617, ; 471: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2883826422, ; 472: Xamarin.Firebase.Installations => 0xabe3b2f6 => 279
	i32 2884993177, ; 473: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 231
	i32 2887636118, ; 474: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 475: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 476: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 477: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 478: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 479: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2914202368, ; 480: Xamarin.Firebase.Iid.Interop => 0xadb33300 => 278
	i32 2916838712, ; 481: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 268
	i32 2919462931, ; 482: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 483: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 203
	i32 2936416060, ; 484: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 485: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 486: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 487: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2965157864, ; 488: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 213
	i32 2968338931, ; 489: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 490: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 491: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 227
	i32 2987532451, ; 492: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 258
	i32 2987996059, ; 493: MetanetA_MobileApp => 0xb219339b => 0
	i32 2991449226, ; 494: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 211
	i32 2996846495, ; 495: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 240
	i32 3000842441, ; 496: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 213
	i32 3016983068, ; 497: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 260
	i32 3017076677, ; 498: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 295
	i32 3023353419, ; 499: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 500: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 235
	i32 3038032645, ; 501: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 347
	i32 3047751430, ; 502: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 211
	i32 3056245963, ; 503: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 257
	i32 3057625584, ; 504: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 248
	i32 3058099980, ; 505: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 297
	i32 3059408633, ; 506: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 507: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3071899978, ; 508: Xamarin.Firebase.Common.dll => 0xb719794a => 272
	i32 3075834255, ; 509: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 510: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 321
	i32 3090735792, ; 511: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 512: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 513: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3106737866, ; 514: Xamarin.Firebase.Datatransport.dll => 0xb92d0eca => 274
	i32 3111772706, ; 515: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 516: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 517: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 518: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 519: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 520: GoogleGson.dll => 0xbba64c02 => 175
	i32 3155362983, ; 521: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 283
	i32 3159123045, ; 522: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 523: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 524: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 249
	i32 3192346100, ; 525: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 526: System.Web => 0xbe592c0c => 152
	i32 3204380047, ; 527: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 528: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 529: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 226
	i32 3215347189, ; 530: zxing => 0xbfa64df5 => 306
	i32 3217618498, ; 531: Microsoft.VisualStudio.DesignTools.XamlTapContract => 0xbfc8f642 => 346
	i32 3220365878, ; 532: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 533: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3230466174, ; 534: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 293
	i32 3251039220, ; 535: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 536: Xamarin.AndroidX.CardView => 0xc235e84d => 214
	i32 3265493905, ; 537: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 538: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 539: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 540: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 541: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286373667, ; 542: ZXing.Net.MAUI.dll => 0xc3e21523 => 307
	i32 3290767353, ; 543: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 544: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 545: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 546: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 316
	i32 3316684772, ; 547: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 548: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 224
	i32 3317144872, ; 549: System.Data => 0xc5b79d28 => 24
	i32 3331531814, ; 550: Xamarin.GooglePlayServices.Stats.dll => 0xc6932426 => 296
	i32 3340431453, ; 551: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 208
	i32 3345895724, ; 552: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 253
	i32 3346324047, ; 553: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 250
	i32 3357674450, ; 554: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 333
	i32 3358260929, ; 555: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 556: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 201
	i32 3362522851, ; 557: Xamarin.AndroidX.Core => 0xc86c06e3 => 221
	i32 3366347497, ; 558: Java.Interop => 0xc8a662e9 => 167
	i32 3371992681, ; 559: Xamarin.Firebase.Encoders.Proto.dll => 0xc8fc8669 => 277
	i32 3374999561, ; 560: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 254
	i32 3381016424, ; 561: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 312
	i32 3383578424, ; 562: Xamarin.Firebase.Encoders.JSON => 0xc9ad4f38 => 276
	i32 3395150330, ; 563: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 564: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 565: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 225
	i32 3413944578, ; 566: Xamarin.AndroidX.Camera.Camera2.dll => 0xcb7ca902 => 210
	i32 3421910702, ; 567: Xamarin.AndroidX.Camera.Camera2 => 0xcbf636ae => 210
	i32 3428513518, ; 568: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 178
	i32 3429136800, ; 569: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 570: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 571: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 228
	i32 3445260447, ; 572: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 573: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 185
	i32 3463511458, ; 574: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 320
	i32 3471940407, ; 575: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 576: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 577: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 333
	i32 3484440000, ; 578: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 332
	i32 3485117614, ; 579: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 580: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 581: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 217
	i32 3500773090, ; 582: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 187
	i32 3509114376, ; 583: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 584: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 585: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 586: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 587: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 588: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 589: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 340
	i32 3597029428, ; 590: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 199
	i32 3598340787, ; 591: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 592: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 593: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 594: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 252
	i32 3633644679, ; 595: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 203
	i32 3638274909, ; 596: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 597: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 238
	i32 3643446276, ; 598: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 337
	i32 3643854240, ; 599: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 249
	i32 3645089577, ; 600: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 601: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 177
	i32 3660523487, ; 602: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 603: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3676461095, ; 604: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 212
	i32 3676670898, ; 605: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 343
	i32 3682565725, ; 606: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 209
	i32 3684561358, ; 607: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 217
	i32 3697841164, ; 608: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 342
	i32 3700866549, ; 609: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 610: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 222
	i32 3716563718, ; 611: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 612: Xamarin.AndroidX.Annotation => 0xdda814c6 => 202
	i32 3724971120, ; 613: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 248
	i32 3732100267, ; 614: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 615: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 616: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 195
	i32 3751444290, ; 617: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3751582913, ; 618: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 308
	i32 3786282454, ; 619: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 215
	i32 3792276235, ; 620: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 621: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 185
	i32 3802395368, ; 622: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 623: CommunityToolkit.Maui.dll => 0xe3886bf7 => 172
	i32 3819260425, ; 624: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 625: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 626: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 627: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 179
	i32 3842894692, ; 628: ZXing.Net.MAUI => 0xe50deb64 => 307
	i32 3844307129, ; 629: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 630: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 631: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 632: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 633: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 634: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 635: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 263
	i32 3888767677, ; 636: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 253
	i32 3889960447, ; 637: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 341
	i32 3896106733, ; 638: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 639: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 221
	i32 3901907137, ; 640: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 641: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 642: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 266
	i32 3928044579, ; 643: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 644: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 645: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 251
	i32 3934056515, ; 646: Xamarin.JavaX.Inject.dll => 0xea7cf043 => 298
	i32 3945713374, ; 647: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 648: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 649: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 205
	i32 3959773229, ; 650: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 240
	i32 3970018735, ; 651: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 297
	i32 3979528423, ; 652: Plugin.Firebase.CloudMessaging => 0xed32c8e7 => 193
	i32 3980434154, ; 653: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 336
	i32 3987592930, ; 654: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 318
	i32 4003436829, ; 655: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 656: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 204
	i32 4025784931, ; 657: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 658: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 659: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 660: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 661: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4094352644, ; 662: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 663: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 664: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 665: Xamarin.AndroidX.Emoji2 => 0xf479582c => 229
	i32 4102112229, ; 666: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 331
	i32 4125707920, ; 667: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 326
	i32 4126470640, ; 668: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 178
	i32 4127667938, ; 669: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 670: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 671: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 672: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 338
	i32 4151237749, ; 673: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 674: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 675: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 676: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 677: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 678: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 245
	i32 4182880526, ; 679: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 344
	i32 4185676441, ; 680: System.Security => 0xf97c5a99 => 129
	i32 4190991637, ; 681: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 192
	i32 4192648326, ; 682: Xamarin.Firebase.Encoders.JSON.dll => 0xf9e6bc86 => 276
	i32 4196529839, ; 683: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 684: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 195
	i32 4256097574, ; 685: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 222
	i32 4258378803, ; 686: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 244
	i32 4260525087, ; 687: System.Buffers => 0xfdf2741f => 7
	i32 4269159614, ; 688: Xamarin.Firebase.Datatransport => 0xfe7634be => 274
	i32 4271975918, ; 689: Microsoft.Maui.Controls.dll => 0xfea12dee => 186
	i32 4274623895, ; 690: CommunityToolkit.Mvvm.dll => 0xfec99597 => 174
	i32 4274976490, ; 691: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4278134329, ; 692: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 295
	i32 4284549794, ; 693: Xamarin.Firebase.Components => 0xff610aa2 => 273
	i32 4292120959, ; 694: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 245
	i32 4294763496 ; 695: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 231
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [696 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 241, ; 3
	i32 291, ; 4
	i32 47, ; 5
	i32 79, ; 6
	i32 212, ; 7
	i32 144, ; 8
	i32 29, ; 9
	i32 342, ; 10
	i32 123, ; 11
	i32 191, ; 12
	i32 101, ; 13
	i32 259, ; 14
	i32 271, ; 15
	i32 106, ; 16
	i32 259, ; 17
	i32 138, ; 18
	i32 302, ; 19
	i32 76, ; 20
	i32 194, ; 21
	i32 123, ; 22
	i32 13, ; 23
	i32 215, ; 24
	i32 131, ; 25
	i32 261, ; 26
	i32 150, ; 27
	i32 339, ; 28
	i32 340, ; 29
	i32 18, ; 30
	i32 209, ; 31
	i32 26, ; 32
	i32 235, ; 33
	i32 1, ; 34
	i32 58, ; 35
	i32 41, ; 36
	i32 90, ; 37
	i32 218, ; 38
	i32 146, ; 39
	i32 237, ; 40
	i32 234, ; 41
	i32 311, ; 42
	i32 53, ; 43
	i32 68, ; 44
	i32 339, ; 45
	i32 200, ; 46
	i32 82, ; 47
	i32 324, ; 48
	i32 236, ; 49
	i32 323, ; 50
	i32 130, ; 51
	i32 54, ; 52
	i32 148, ; 53
	i32 73, ; 54
	i32 144, ; 55
	i32 61, ; 56
	i32 145, ; 57
	i32 347, ; 58
	i32 164, ; 59
	i32 335, ; 60
	i32 219, ; 61
	i32 12, ; 62
	i32 232, ; 63
	i32 124, ; 64
	i32 151, ; 65
	i32 112, ; 66
	i32 165, ; 67
	i32 163, ; 68
	i32 234, ; 69
	i32 285, ; 70
	i32 247, ; 71
	i32 285, ; 72
	i32 83, ; 73
	i32 322, ; 74
	i32 316, ; 75
	i32 283, ; 76
	i32 184, ; 77
	i32 149, ; 78
	i32 302, ; 79
	i32 59, ; 80
	i32 180, ; 81
	i32 50, ; 82
	i32 296, ; 83
	i32 102, ; 84
	i32 113, ; 85
	i32 39, ; 86
	i32 288, ; 87
	i32 270, ; 88
	i32 119, ; 89
	i32 330, ; 90
	i32 172, ; 91
	i32 51, ; 92
	i32 43, ; 93
	i32 118, ; 94
	i32 224, ; 95
	i32 328, ; 96
	i32 230, ; 97
	i32 80, ; 98
	i32 135, ; 99
	i32 266, ; 100
	i32 207, ; 101
	i32 8, ; 102
	i32 72, ; 103
	i32 310, ; 104
	i32 154, ; 105
	i32 304, ; 106
	i32 153, ; 107
	i32 91, ; 108
	i32 299, ; 109
	i32 44, ; 110
	i32 325, ; 111
	i32 313, ; 112
	i32 303, ; 113
	i32 108, ; 114
	i32 128, ; 115
	i32 25, ; 116
	i32 197, ; 117
	i32 71, ; 118
	i32 54, ; 119
	i32 45, ; 120
	i32 334, ; 121
	i32 287, ; 122
	i32 183, ; 123
	i32 225, ; 124
	i32 22, ; 125
	i32 239, ; 126
	i32 85, ; 127
	i32 42, ; 128
	i32 159, ; 129
	i32 70, ; 130
	i32 308, ; 131
	i32 252, ; 132
	i32 279, ; 133
	i32 193, ; 134
	i32 306, ; 135
	i32 3, ; 136
	i32 41, ; 137
	i32 62, ; 138
	i32 280, ; 139
	i32 16, ; 140
	i32 192, ; 141
	i32 52, ; 142
	i32 337, ; 143
	i32 291, ; 144
	i32 104, ; 145
	i32 303, ; 146
	i32 194, ; 147
	i32 289, ; 148
	i32 236, ; 149
	i32 33, ; 150
	i32 157, ; 151
	i32 84, ; 152
	i32 31, ; 153
	i32 12, ; 154
	i32 50, ; 155
	i32 284, ; 156
	i32 55, ; 157
	i32 256, ; 158
	i32 35, ; 159
	i32 179, ; 160
	i32 312, ; 161
	i32 290, ; 162
	i32 205, ; 163
	i32 294, ; 164
	i32 34, ; 165
	i32 57, ; 166
	i32 243, ; 167
	i32 287, ; 168
	i32 175, ; 169
	i32 17, ; 170
	i32 300, ; 171
	i32 163, ; 172
	i32 325, ; 173
	i32 242, ; 174
	i32 182, ; 175
	i32 281, ; 176
	i32 269, ; 177
	i32 331, ; 178
	i32 152, ; 179
	i32 265, ; 180
	i32 250, ; 181
	i32 329, ; 182
	i32 207, ; 183
	i32 28, ; 184
	i32 174, ; 185
	i32 51, ; 186
	i32 327, ; 187
	i32 270, ; 188
	i32 5, ; 189
	i32 311, ; 190
	i32 260, ; 191
	i32 264, ; 192
	i32 216, ; 193
	i32 304, ; 194
	i32 204, ; 195
	i32 227, ; 196
	i32 84, ; 197
	i32 269, ; 198
	i32 60, ; 199
	i32 272, ; 200
	i32 111, ; 201
	i32 56, ; 202
	i32 341, ; 203
	i32 256, ; 204
	i32 98, ; 205
	i32 298, ; 206
	i32 19, ; 207
	i32 220, ; 208
	i32 110, ; 209
	i32 100, ; 210
	i32 101, ; 211
	i32 309, ; 212
	i32 103, ; 213
	i32 289, ; 214
	i32 70, ; 215
	i32 37, ; 216
	i32 31, ; 217
	i32 102, ; 218
	i32 72, ; 219
	i32 315, ; 220
	i32 9, ; 221
	i32 122, ; 222
	i32 45, ; 223
	i32 206, ; 224
	i32 184, ; 225
	i32 9, ; 226
	i32 42, ; 227
	i32 4, ; 228
	i32 257, ; 229
	i32 319, ; 230
	i32 314, ; 231
	i32 278, ; 232
	i32 30, ; 233
	i32 137, ; 234
	i32 91, ; 235
	i32 92, ; 236
	i32 334, ; 237
	i32 48, ; 238
	i32 140, ; 239
	i32 111, ; 240
	i32 139, ; 241
	i32 226, ; 242
	i32 114, ; 243
	i32 290, ; 244
	i32 156, ; 245
	i32 343, ; 246
	i32 75, ; 247
	i32 78, ; 248
	i32 246, ; 249
	i32 36, ; 250
	i32 268, ; 251
	i32 173, ; 252
	i32 230, ; 253
	i32 223, ; 254
	i32 63, ; 255
	i32 137, ; 256
	i32 15, ; 257
	i32 115, ; 258
	i32 262, ; 259
	i32 286, ; 260
	i32 218, ; 261
	i32 47, ; 262
	i32 69, ; 263
	i32 79, ; 264
	i32 125, ; 265
	i32 93, ; 266
	i32 120, ; 267
	i32 301, ; 268
	i32 26, ; 269
	i32 239, ; 270
	i32 96, ; 271
	i32 27, ; 272
	i32 214, ; 273
	i32 332, ; 274
	i32 310, ; 275
	i32 148, ; 276
	i32 168, ; 277
	i32 4, ; 278
	i32 97, ; 279
	i32 32, ; 280
	i32 92, ; 281
	i32 261, ; 282
	i32 180, ; 283
	i32 21, ; 284
	i32 40, ; 285
	i32 169, ; 286
	i32 326, ; 287
	i32 232, ; 288
	i32 318, ; 289
	i32 246, ; 290
	i32 300, ; 291
	i32 286, ; 292
	i32 251, ; 293
	i32 2, ; 294
	i32 133, ; 295
	i32 110, ; 296
	i32 345, ; 297
	i32 181, ; 298
	i32 338, ; 299
	i32 197, ; 300
	i32 335, ; 301
	i32 57, ; 302
	i32 94, ; 303
	i32 317, ; 304
	i32 277, ; 305
	i32 38, ; 306
	i32 208, ; 307
	i32 345, ; 308
	i32 25, ; 309
	i32 93, ; 310
	i32 88, ; 311
	i32 98, ; 312
	i32 293, ; 313
	i32 10, ; 314
	i32 282, ; 315
	i32 86, ; 316
	i32 99, ; 317
	i32 258, ; 318
	i32 176, ; 319
	i32 301, ; 320
	i32 199, ; 321
	i32 314, ; 322
	i32 7, ; 323
	i32 243, ; 324
	i32 309, ; 325
	i32 196, ; 326
	i32 87, ; 327
	i32 238, ; 328
	i32 153, ; 329
	i32 313, ; 330
	i32 32, ; 331
	i32 115, ; 332
	i32 81, ; 333
	i32 346, ; 334
	i32 284, ; 335
	i32 20, ; 336
	i32 292, ; 337
	i32 11, ; 338
	i32 161, ; 339
	i32 3, ; 340
	i32 189, ; 341
	i32 321, ; 342
	i32 271, ; 343
	i32 183, ; 344
	i32 181, ; 345
	i32 83, ; 346
	i32 305, ; 347
	i32 63, ; 348
	i32 323, ; 349
	i32 265, ; 350
	i32 142, ; 351
	i32 247, ; 352
	i32 156, ; 353
	i32 40, ; 354
	i32 116, ; 355
	i32 177, ; 356
	i32 198, ; 357
	i32 317, ; 358
	i32 254, ; 359
	i32 130, ; 360
	i32 74, ; 361
	i32 65, ; 362
	i32 187, ; 363
	i32 327, ; 364
	i32 171, ; 365
	i32 202, ; 366
	i32 142, ; 367
	i32 105, ; 368
	i32 150, ; 369
	i32 69, ; 370
	i32 155, ; 371
	i32 176, ; 372
	i32 120, ; 373
	i32 126, ; 374
	i32 322, ; 375
	i32 151, ; 376
	i32 229, ; 377
	i32 344, ; 378
	i32 140, ; 379
	i32 216, ; 380
	i32 319, ; 381
	i32 20, ; 382
	i32 14, ; 383
	i32 134, ; 384
	i32 74, ; 385
	i32 58, ; 386
	i32 219, ; 387
	i32 166, ; 388
	i32 167, ; 389
	i32 186, ; 390
	i32 281, ; 391
	i32 282, ; 392
	i32 15, ; 393
	i32 73, ; 394
	i32 294, ; 395
	i32 6, ; 396
	i32 23, ; 397
	i32 241, ; 398
	i32 196, ; 399
	i32 90, ; 400
	i32 320, ; 401
	i32 1, ; 402
	i32 135, ; 403
	i32 242, ; 404
	i32 264, ; 405
	i32 133, ; 406
	i32 68, ; 407
	i32 145, ; 408
	i32 329, ; 409
	i32 305, ; 410
	i32 233, ; 411
	i32 182, ; 412
	i32 87, ; 413
	i32 0, ; 414
	i32 95, ; 415
	i32 275, ; 416
	i32 223, ; 417
	i32 280, ; 418
	i32 228, ; 419
	i32 324, ; 420
	i32 30, ; 421
	i32 44, ; 422
	i32 237, ; 423
	i32 275, ; 424
	i32 198, ; 425
	i32 108, ; 426
	i32 157, ; 427
	i32 34, ; 428
	i32 22, ; 429
	i32 113, ; 430
	i32 56, ; 431
	i32 262, ; 432
	i32 143, ; 433
	i32 117, ; 434
	i32 119, ; 435
	i32 109, ; 436
	i32 200, ; 437
	i32 138, ; 438
	i32 206, ; 439
	i32 53, ; 440
	i32 104, ; 441
	i32 330, ; 442
	i32 188, ; 443
	i32 189, ; 444
	i32 132, ; 445
	i32 299, ; 446
	i32 267, ; 447
	i32 255, ; 448
	i32 336, ; 449
	i32 233, ; 450
	i32 191, ; 451
	i32 158, ; 452
	i32 273, ; 453
	i32 315, ; 454
	i32 220, ; 455
	i32 162, ; 456
	i32 131, ; 457
	i32 255, ; 458
	i32 160, ; 459
	i32 328, ; 460
	i32 244, ; 461
	i32 292, ; 462
	i32 139, ; 463
	i32 267, ; 464
	i32 263, ; 465
	i32 168, ; 466
	i32 190, ; 467
	i32 173, ; 468
	i32 201, ; 469
	i32 288, ; 470
	i32 39, ; 471
	i32 279, ; 472
	i32 231, ; 473
	i32 80, ; 474
	i32 55, ; 475
	i32 36, ; 476
	i32 96, ; 477
	i32 165, ; 478
	i32 171, ; 479
	i32 278, ; 480
	i32 268, ; 481
	i32 81, ; 482
	i32 203, ; 483
	i32 97, ; 484
	i32 29, ; 485
	i32 158, ; 486
	i32 18, ; 487
	i32 213, ; 488
	i32 126, ; 489
	i32 118, ; 490
	i32 227, ; 491
	i32 258, ; 492
	i32 0, ; 493
	i32 211, ; 494
	i32 240, ; 495
	i32 213, ; 496
	i32 260, ; 497
	i32 295, ; 498
	i32 164, ; 499
	i32 235, ; 500
	i32 347, ; 501
	i32 211, ; 502
	i32 257, ; 503
	i32 248, ; 504
	i32 297, ; 505
	i32 169, ; 506
	i32 16, ; 507
	i32 272, ; 508
	i32 143, ; 509
	i32 321, ; 510
	i32 124, ; 511
	i32 117, ; 512
	i32 37, ; 513
	i32 274, ; 514
	i32 114, ; 515
	i32 46, ; 516
	i32 141, ; 517
	i32 116, ; 518
	i32 33, ; 519
	i32 175, ; 520
	i32 283, ; 521
	i32 94, ; 522
	i32 52, ; 523
	i32 249, ; 524
	i32 128, ; 525
	i32 152, ; 526
	i32 24, ; 527
	i32 160, ; 528
	i32 226, ; 529
	i32 306, ; 530
	i32 346, ; 531
	i32 147, ; 532
	i32 103, ; 533
	i32 293, ; 534
	i32 88, ; 535
	i32 214, ; 536
	i32 59, ; 537
	i32 141, ; 538
	i32 99, ; 539
	i32 5, ; 540
	i32 13, ; 541
	i32 307, ; 542
	i32 121, ; 543
	i32 134, ; 544
	i32 27, ; 545
	i32 316, ; 546
	i32 71, ; 547
	i32 224, ; 548
	i32 24, ; 549
	i32 296, ; 550
	i32 208, ; 551
	i32 253, ; 552
	i32 250, ; 553
	i32 333, ; 554
	i32 136, ; 555
	i32 201, ; 556
	i32 221, ; 557
	i32 167, ; 558
	i32 277, ; 559
	i32 254, ; 560
	i32 312, ; 561
	i32 276, ; 562
	i32 100, ; 563
	i32 122, ; 564
	i32 225, ; 565
	i32 210, ; 566
	i32 210, ; 567
	i32 178, ; 568
	i32 162, ; 569
	i32 166, ; 570
	i32 228, ; 571
	i32 38, ; 572
	i32 185, ; 573
	i32 320, ; 574
	i32 17, ; 575
	i32 170, ; 576
	i32 333, ; 577
	i32 332, ; 578
	i32 136, ; 579
	i32 149, ; 580
	i32 217, ; 581
	i32 187, ; 582
	i32 154, ; 583
	i32 129, ; 584
	i32 19, ; 585
	i32 64, ; 586
	i32 146, ; 587
	i32 46, ; 588
	i32 340, ; 589
	i32 199, ; 590
	i32 78, ; 591
	i32 60, ; 592
	i32 105, ; 593
	i32 252, ; 594
	i32 203, ; 595
	i32 48, ; 596
	i32 238, ; 597
	i32 337, ; 598
	i32 249, ; 599
	i32 14, ; 600
	i32 177, ; 601
	i32 67, ; 602
	i32 170, ; 603
	i32 212, ; 604
	i32 343, ; 605
	i32 209, ; 606
	i32 217, ; 607
	i32 342, ; 608
	i32 77, ; 609
	i32 222, ; 610
	i32 107, ; 611
	i32 202, ; 612
	i32 248, ; 613
	i32 66, ; 614
	i32 62, ; 615
	i32 195, ; 616
	i32 159, ; 617
	i32 308, ; 618
	i32 215, ; 619
	i32 10, ; 620
	i32 185, ; 621
	i32 11, ; 622
	i32 172, ; 623
	i32 77, ; 624
	i32 125, ; 625
	i32 82, ; 626
	i32 179, ; 627
	i32 307, ; 628
	i32 65, ; 629
	i32 106, ; 630
	i32 64, ; 631
	i32 127, ; 632
	i32 121, ; 633
	i32 76, ; 634
	i32 263, ; 635
	i32 253, ; 636
	i32 341, ; 637
	i32 8, ; 638
	i32 221, ; 639
	i32 2, ; 640
	i32 43, ; 641
	i32 266, ; 642
	i32 155, ; 643
	i32 127, ; 644
	i32 251, ; 645
	i32 298, ; 646
	i32 23, ; 647
	i32 132, ; 648
	i32 205, ; 649
	i32 240, ; 650
	i32 297, ; 651
	i32 193, ; 652
	i32 336, ; 653
	i32 318, ; 654
	i32 28, ; 655
	i32 204, ; 656
	i32 61, ; 657
	i32 188, ; 658
	i32 89, ; 659
	i32 86, ; 660
	i32 147, ; 661
	i32 190, ; 662
	i32 35, ; 663
	i32 85, ; 664
	i32 229, ; 665
	i32 331, ; 666
	i32 326, ; 667
	i32 178, ; 668
	i32 49, ; 669
	i32 6, ; 670
	i32 89, ; 671
	i32 338, ; 672
	i32 21, ; 673
	i32 161, ; 674
	i32 95, ; 675
	i32 49, ; 676
	i32 112, ; 677
	i32 245, ; 678
	i32 344, ; 679
	i32 129, ; 680
	i32 192, ; 681
	i32 276, ; 682
	i32 75, ; 683
	i32 195, ; 684
	i32 222, ; 685
	i32 244, ; 686
	i32 7, ; 687
	i32 274, ; 688
	i32 186, ; 689
	i32 174, ; 690
	i32 109, ; 691
	i32 295, ; 692
	i32 273, ; 693
	i32 245, ; 694
	i32 231 ; 695
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
