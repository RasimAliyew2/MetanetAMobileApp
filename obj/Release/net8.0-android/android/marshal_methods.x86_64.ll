; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [141 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [282 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 45
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 140
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 51
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 113
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 64
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 81
	i64 435118502366263740, ; 6: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 82
	i64 545109961164950392, ; 7: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 590337075967009532, ; 8: Microsoft.Maui.Maps.dll => 0x8314c715ec1a2fc => 53
	i64 687654259221141486, ; 9: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 92
	i64 750875890346172408, ; 10: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 132
	i64 799765834175365804, ; 11: System.ComponentModel.dll => 0xb1956c9f18442ac => 108
	i64 849051935479314978, ; 12: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 13: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 69
	i64 1120440138749646132, ; 14: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 90
	i64 1121665720830085036, ; 15: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1369545283391376210, ; 16: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 77
	i64 1476839205573959279, ; 17: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 118
	i64 1486715745332614827, ; 18: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 47
	i64 1513467482682125403, ; 19: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 139
	i64 1537168428375924959, ; 20: System.Threading.Thread.dll => 0x15551e8a954ae0df => 132
	i64 1556147632182429976, ; 21: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 22: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 59
	i64 1628611045998245443, ; 23: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 74
	i64 1735388228521408345, ; 24: System.Net.Mail.dll => 0x181556663c69b759 => 117
	i64 1743969030606105336, ; 25: System.Memory.dll => 0x1833d297e88f2af8 => 115
	i64 1767386781656293639, ; 26: System.Private.Uri.dll => 0x188704e9f5582107 => 122
	i64 1795316252682057001, ; 27: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 58
	i64 1835311033149317475, ; 28: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 29: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 81
	i64 1881198190668717030, ; 30: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 31: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 82
	i64 1920760634179481754, ; 32: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 49
	i64 1930726298510463061, ; 33: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1959996714666907089, ; 34: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 35: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 73
	i64 1983698669889758782, ; 36: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 37: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2262844636196693701, ; 38: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 69
	i64 2287834202362508563, ; 39: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 102
	i64 2302323944321350744, ; 40: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 72
	i64 2335503487726329082, ; 42: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 129
	i64 2470498323731680442, ; 43: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 65
	i64 2497223385847772520, ; 44: System.Runtime => 0x22a7eb7046413568 => 127
	i64 2547086958574651984, ; 45: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 57
	i64 2602673633151553063, ; 46: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 47: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 40
	i64 2662981627730767622, ; 48: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 49: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 50: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 90
	i64 3289520064315143713, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 71
	i64 3311221304742556517, ; 52: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 120
	i64 3325875462027654285, ; 53: System.Runtime.Numerics => 0x2e27e21c8958b48d => 126
	i64 3344514922410554693, ; 54: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 97
	i64 3364695309916733813, ; 55: Xamarin.Firebase.Common => 0x2eb1cc8eb5028175 => 87
	i64 3411255996856937470, ; 56: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 93
	i64 3429672777697402584, ; 57: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 51
	i64 3494946837667399002, ; 58: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 38
	i64 3522470458906976663, ; 59: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 83
	i64 3551103847008531295, ; 60: System.Private.CoreLib.dll => 0x31480e226177735f => 137
	i64 3567343442040498961, ; 61: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 62: System.Runtime.dll => 0x319037675df7e556 => 127
	i64 3638003163729360188, ; 63: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 39
	i64 3647754201059316852, ; 64: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 135
	i64 3655542548057982301, ; 65: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 38
	i64 3727469159507183293, ; 66: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 80
	i64 3869221888984012293, ; 67: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 42
	i64 3890352374528606784, ; 68: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 49
	i64 3933965368022646939, ; 69: System.Net.Requests => 0x369840a8bfadc09b => 119
	i64 3966267475168208030, ; 70: System.Memory => 0x370b03412596249e => 115
	i64 4073500526318903918, ; 71: System.Private.Xml.dll => 0x3887fb25779ae26e => 123
	i64 4073631083018132676, ; 72: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 46
	i64 4120493066591692148, ; 73: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 74: System.ComponentModel => 0x39a7562737acb67e => 108
	i64 4187479170553454871, ; 75: System.Linq.Expressions => 0x3a1cea1e912fa117 => 113
	i64 4205801962323029395, ; 76: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 107
	i64 4247996603072512073, ; 77: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 95
	i64 4356591372459378815, ; 78: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4477672992252076438, ; 79: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 134
	i64 4636684751163556186, ; 80: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 84
	i64 4679594760078841447, ; 81: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4725285941539738176, ; 82: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 61
	i64 4794310189461587505, ; 83: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 57
	i64 4795410492532947900, ; 84: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 83
	i64 4853321196694829351, ; 85: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 125
	i64 5290786973231294105, ; 86: System.Runtime.Loader => 0x496ca6b869b72699 => 125
	i64 5426193594926737925, ; 87: Plugin.Firebase.Core => 0x4b4db6534c1baa05 => 55
	i64 5471532531798518949, ; 88: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 89: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 90: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 111
	i64 5573260873512690141, ; 91: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 128
	i64 5573669443803475672, ; 92: Microsoft.Maui.Controls.Maps => 0x4d59a6d41d5aeed8 => 48
	i64 5692067934154308417, ; 93: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 86
	i64 6068057819846744445, ; 94: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 95: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 96: System.Text.Json.dll => 0x565a67a0ffe264a7 => 130
	i64 6357457916754632952, ; 97: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 98: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 72
	i64 6478287442656530074, ; 99: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 100: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 68
	i64 6560151584539558821, ; 101: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 44
	i64 6594803674001204912, ; 102: Plugin.Firebase.CloudMessaging => 0x5b857300304866b0 => 54
	i64 6743165466166707109, ; 103: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 104: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 105: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 110
	i64 6894844156784520562, ; 106: System.Numerics.Vectors => 0x5faf683aead1ad72 => 120
	i64 6985504089449394141, ; 107: ZXing.Net.MAUI.Controls.dll => 0x60f17ef564ab6fdd => 100
	i64 7141281584637745974, ; 108: Xamarin.GooglePlayServices.Maps.dll => 0x631aedc3dd5f1b36 => 94
	i64 7220009545223068405, ; 109: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 110: System.Linq => 0x64e71ccf51a90a5a => 114
	i64 7377312882064240630, ; 111: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 107
	i64 7489048572193775167, ; 112: System.ObjectModel => 0x67ee71ff6b419e3f => 121
	i64 7654504624184590948, ; 113: System.Net.Http => 0x6a3a4366801b8264 => 116
	i64 7694700312542370399, ; 114: System.Net.Mail => 0x6ac9112a7e2cda5f => 117
	i64 7708790323521193081, ; 115: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 116: System.Private.CoreLib => 0x6b0ff375198b9c17 => 137
	i64 7735352534559001595, ; 117: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 96
	i64 7836164640616011524, ; 118: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 59
	i64 8064050204834738623, ; 119: System.Collections.dll => 0x6fe942efa61731bf => 105
	i64 8083354569033831015, ; 120: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 71
	i64 8087206902342787202, ; 121: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 56
	i64 8167236081217502503, ; 122: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 138
	i64 8185542183669246576, ; 123: System.Collections => 0x7198e33f4794aa70 => 105
	i64 8246048515196606205, ; 124: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 52
	i64 8320777595162576093, ; 125: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 62
	i64 8368701292315763008, ; 126: System.Security.Cryptography => 0x7423997c6fd56140 => 128
	i64 8400357532724379117, ; 127: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 79
	i64 8465511506719290632, ; 128: Xamarin.Firebase.Messaging.dll => 0x757b89dcf7fc3508 => 88
	i64 8518412311883997971, ; 129: System.Collections.Immutable => 0x76377add7c28e313 => 103
	i64 8563666267364444763, ; 130: System.Private.Uri => 0x76d841191140ca5b => 122
	i64 8599632406834268464, ; 131: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 132: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 133: Java.Interop => 0x77b654e585b55834 => 138
	i64 8629545377263870989, ; 134: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 60
	i64 8639588376636138208, ; 135: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 78
	i64 8677882282824630478, ; 136: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 137: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 56
	i64 9045785047181495996, ; 138: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9131857290992441898, ; 139: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 60
	i64 9285318971778582014, ; 140: Plugin.Firebase.Core.dll => 0x80dc1468bb0ec5fe => 55
	i64 9312692141327339315, ; 141: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 86
	i64 9324707631942237306, ; 142: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 58
	i64 9659729154652888475, ; 143: System.Text.RegularExpressions => 0x860e407c9991dd9b => 131
	i64 9678050649315576968, ; 144: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 65
	i64 9702891218465930390, ; 145: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 104
	i64 9808709177481450983, ; 146: Mono.Android.dll => 0x881f890734e555e7 => 140
	i64 9875200773399460291, ; 147: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 92
	i64 9956195530459977388, ; 148: Microsoft.Maui => 0x8a2b8315b36616ac => 50
	i64 9991543690424095600, ; 149: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 150: System.Net.Http.dll => 0x8b50e941206af13b => 116
	i64 10051358222726253779, ; 151: System.Private.Xml => 0x8b7d990c97ccccd3 => 123
	i64 10092835686693276772, ; 152: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 47
	i64 10143853363526200146, ; 153: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 154: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 68
	i64 10406448008575299332, ; 155: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 97
	i64 10430153318873392755, ; 156: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 66
	i64 10506226065143327199, ; 157: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 158: System.Net.Primitives => 0x95ac8cfb68830758 => 118
	i64 10880838204485145808, ; 159: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 160: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 43
	i64 11009005086950030778, ; 161: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 50
	i64 11103970607964515343, ; 162: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 163: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 85
	i64 11220793807500858938, ; 164: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 165: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 44
	i64 11340910727871153756, ; 166: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 67
	i64 11485890710487134646, ; 167: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 124
	i64 11518296021396496455, ; 168: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 169: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 85
	i64 11530571088791430846, ; 170: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 42
	i64 11705530742807338875, ; 171: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12010362171126083089, ; 172: Plugin.Firebase.CloudMessaging.dll => 0xa6ad60c2d1c26e11 => 54
	i64 12145679461940342714, ; 173: System.Text.Json => 0xa88e1f1ebcb62fba => 130
	i64 12269460666702402136, ; 174: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 103
	i64 12341818387765915815, ; 175: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 176: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 70
	i64 12466513435562512481, ; 177: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 75
	i64 12475113361194491050, ; 178: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 179: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 110
	i64 12538491095302438457, ; 180: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 63
	i64 12550732019250633519, ; 181: System.IO.Compression => 0xae2d28465e8e1b2f => 112
	i64 12681088699309157496, ; 182: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 183: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 64
	i64 12760970142902902754, ; 184: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 61
	i64 12823819093633476069, ; 185: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 186: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 45
	i64 13221551921002590604, ; 187: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 188: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 189: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 139
	i64 13381594904270902445, ; 190: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13454009404024712428, ; 191: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 91
	i64 13465488254036897740, ; 192: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 96
	i64 13467053111158216594, ; 193: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 194: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 195: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 196: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 80
	i64 13717397318615465333, ; 197: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 106
	i64 13755568601956062840, ; 198: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 199: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 200: System.Console.dll => 0xc0a5f3cade5c6774 => 109
	i64 13959074834287824816, ; 201: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 70
	i64 14100563506285742564, ; 202: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 203: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 63
	i64 14125464355221830302, ; 204: System.Threading.dll => 0xc407bafdbc707a9e => 133
	i64 14437941549388880843, ; 205: MetanetA_MobileApp => 0xc85ddf57fb2d5bcb => 101
	i64 14461014870687870182, ; 206: System.Net.Requests.dll => 0xc8afd8683afdece6 => 119
	i64 14464374589798375073, ; 207: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 208: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 209: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 129
	i64 14556034074661724008, ; 210: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14669215534098758659, ; 211: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 40
	i64 14690985099581930927, ; 212: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 134
	i64 14705122255218365489, ; 213: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 214: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14789919016435397935, ; 215: Xamarin.Firebase.Common.dll => 0xcd4058fc2f6d352f => 87
	i64 14792063746108907174, ; 216: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 91
	i64 14852515768018889994, ; 217: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 67
	i64 14892012299694389861, ; 218: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 219: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 220: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 41
	i64 14987728460634540364, ; 221: System.IO.Compression.dll => 0xcfff1ba06622494c => 112
	i64 15076659072870671916, ; 222: System.ObjectModel.dll => 0xd13b0d8c1620662c => 121
	i64 15111608613780139878, ; 223: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 224: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 111
	i64 15133485256822086103, ; 225: System.Linq.dll => 0xd204f0a9127dd9d7 => 114
	i64 15227001540531775957, ; 226: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 39
	i64 15370334346939861994, ; 227: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 66
	i64 15391712275433856905, ; 228: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 41
	i64 15527772828719725935, ; 229: System.Console => 0xd77dbb1e38cd3d6f => 109
	i64 15536481058354060254, ; 230: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15557147985555663328, ; 231: MetanetA_MobileApp.dll => 0xd7e617aae53aa9e0 => 101
	i64 15582737692548360875, ; 232: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 74
	i64 15609085926864131306, ; 233: System.dll => 0xd89e9cf3334914ea => 136
	i64 15661133872274321916, ; 234: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 135
	i64 15664356999916475676, ; 235: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 236: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15750144475371186037, ; 237: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 62
	i64 15783653065526199428, ; 238: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15928521404965645318, ; 239: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 46
	i64 15930129725311349754, ; 240: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 95
	i64 16154507427712707110, ; 241: System => 0xe03056ea4e39aa26 => 136
	i64 16182611612321266217, ; 242: Microsoft.Maui.Maps => 0xe0942f85b2853a29 => 53
	i64 16274182383641215830, ; 243: zxing.dll => 0xe1d982a752dac356 => 98
	i64 16288847719894691167, ; 244: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 245: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 43
	i64 16467346005009053642, ; 246: Xamarin.Google.Android.DataTransport.TransportApi => 0xe487c3f19e0337ca => 89
	i64 16648892297579399389, ; 247: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 248: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 52
	i64 16677317093839702854, ; 249: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 79
	i64 16885326587688996227, ; 250: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 99
	i64 16890310621557459193, ; 251: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 131
	i64 16942731696432749159, ; 252: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 253: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 77
	i64 17008137082415910100, ; 254: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 104
	i64 17027804579603049667, ; 255: Microsoft.Maui.Controls.Maps.dll => 0xec4eea0c48026cc3 => 48
	i64 17031351772568316411, ; 256: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 76
	i64 17040771374769818752, ; 257: zxing => 0xec7cfb478bcccc80 => 98
	i64 17062143951396181894, ; 258: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 106
	i64 17089008752050867324, ; 259: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17306917412052548875, ; 260: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 99
	i64 17342750010158924305, ; 261: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 262: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 263: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 264: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 265: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 266: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 75
	i64 17710060891934109755, ; 267: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 73
	i64 17712670374920797664, ; 268: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 124
	i64 17777860260071588075, ; 269: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 126
	i64 17945795017270165205, ; 270: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0xf90c457cc05cfed5 => 89
	i64 17969331831154222830, ; 271: Xamarin.GooglePlayServices.Maps => 0xf95fe418471126ee => 94
	i64 17986907704309214542, ; 272: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 93
	i64 18025913125965088385, ; 273: System.Threading => 0xfa28e87b91334681 => 133
	i64 18099568558057551825, ; 274: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 275: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 76
	i64 18245806341561545090, ; 276: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 102
	i64 18305135509493619199, ; 277: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 78
	i64 18324163916253801303, ; 278: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18335459783622540540, ; 279: ZXing.Net.MAUI.Controls => 0xfe74a3871c483cfc => 100
	i64 18337470502355292274, ; 280: Xamarin.Firebase.Messaging => 0xfe7bc8440c175072 => 88
	i64 18380184030268848184 ; 281: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 84
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [282 x i32] [
	i32 45, ; 0
	i32 140, ; 1
	i32 51, ; 2
	i32 113, ; 3
	i32 64, ; 4
	i32 81, ; 5
	i32 82, ; 6
	i32 7, ; 7
	i32 53, ; 8
	i32 92, ; 9
	i32 132, ; 10
	i32 108, ; 11
	i32 10, ; 12
	i32 69, ; 13
	i32 90, ; 14
	i32 18, ; 15
	i32 77, ; 16
	i32 118, ; 17
	i32 47, ; 18
	i32 139, ; 19
	i32 132, ; 20
	i32 16, ; 21
	i32 59, ; 22
	i32 74, ; 23
	i32 117, ; 24
	i32 115, ; 25
	i32 122, ; 26
	i32 58, ; 27
	i32 6, ; 28
	i32 81, ; 29
	i32 28, ; 30
	i32 82, ; 31
	i32 49, ; 32
	i32 37, ; 33
	i32 28, ; 34
	i32 73, ; 35
	i32 2, ; 36
	i32 20, ; 37
	i32 69, ; 38
	i32 102, ; 39
	i32 24, ; 40
	i32 72, ; 41
	i32 129, ; 42
	i32 65, ; 43
	i32 127, ; 44
	i32 57, ; 45
	i32 27, ; 46
	i32 40, ; 47
	i32 2, ; 48
	i32 7, ; 49
	i32 90, ; 50
	i32 71, ; 51
	i32 120, ; 52
	i32 126, ; 53
	i32 97, ; 54
	i32 87, ; 55
	i32 93, ; 56
	i32 51, ; 57
	i32 38, ; 58
	i32 83, ; 59
	i32 137, ; 60
	i32 22, ; 61
	i32 127, ; 62
	i32 39, ; 63
	i32 135, ; 64
	i32 38, ; 65
	i32 80, ; 66
	i32 42, ; 67
	i32 49, ; 68
	i32 119, ; 69
	i32 115, ; 70
	i32 123, ; 71
	i32 46, ; 72
	i32 33, ; 73
	i32 108, ; 74
	i32 113, ; 75
	i32 107, ; 76
	i32 95, ; 77
	i32 30, ; 78
	i32 134, ; 79
	i32 84, ; 80
	i32 0, ; 81
	i32 61, ; 82
	i32 57, ; 83
	i32 83, ; 84
	i32 125, ; 85
	i32 125, ; 86
	i32 55, ; 87
	i32 26, ; 88
	i32 29, ; 89
	i32 111, ; 90
	i32 128, ; 91
	i32 48, ; 92
	i32 86, ; 93
	i32 23, ; 94
	i32 23, ; 95
	i32 130, ; 96
	i32 34, ; 97
	i32 72, ; 98
	i32 11, ; 99
	i32 68, ; 100
	i32 44, ; 101
	i32 54, ; 102
	i32 19, ; 103
	i32 22, ; 104
	i32 110, ; 105
	i32 120, ; 106
	i32 100, ; 107
	i32 94, ; 108
	i32 26, ; 109
	i32 114, ; 110
	i32 107, ; 111
	i32 121, ; 112
	i32 116, ; 113
	i32 117, ; 114
	i32 17, ; 115
	i32 137, ; 116
	i32 96, ; 117
	i32 59, ; 118
	i32 105, ; 119
	i32 71, ; 120
	i32 56, ; 121
	i32 138, ; 122
	i32 105, ; 123
	i32 52, ; 124
	i32 62, ; 125
	i32 128, ; 126
	i32 79, ; 127
	i32 88, ; 128
	i32 103, ; 129
	i32 122, ; 130
	i32 35, ; 131
	i32 21, ; 132
	i32 138, ; 133
	i32 60, ; 134
	i32 78, ; 135
	i32 21, ; 136
	i32 56, ; 137
	i32 31, ; 138
	i32 60, ; 139
	i32 55, ; 140
	i32 86, ; 141
	i32 58, ; 142
	i32 131, ; 143
	i32 65, ; 144
	i32 104, ; 145
	i32 140, ; 146
	i32 92, ; 147
	i32 50, ; 148
	i32 6, ; 149
	i32 116, ; 150
	i32 123, ; 151
	i32 47, ; 152
	i32 3, ; 153
	i32 68, ; 154
	i32 97, ; 155
	i32 66, ; 156
	i32 1, ; 157
	i32 118, ; 158
	i32 35, ; 159
	i32 43, ; 160
	i32 50, ; 161
	i32 12, ; 162
	i32 85, ; 163
	i32 15, ; 164
	i32 44, ; 165
	i32 67, ; 166
	i32 124, ; 167
	i32 13, ; 168
	i32 85, ; 169
	i32 42, ; 170
	i32 9, ; 171
	i32 54, ; 172
	i32 130, ; 173
	i32 103, ; 174
	i32 36, ; 175
	i32 70, ; 176
	i32 75, ; 177
	i32 34, ; 178
	i32 110, ; 179
	i32 63, ; 180
	i32 112, ; 181
	i32 14, ; 182
	i32 64, ; 183
	i32 61, ; 184
	i32 27, ; 185
	i32 45, ; 186
	i32 1, ; 187
	i32 15, ; 188
	i32 139, ; 189
	i32 9, ; 190
	i32 91, ; 191
	i32 96, ; 192
	i32 29, ; 193
	i32 30, ; 194
	i32 13, ; 195
	i32 80, ; 196
	i32 106, ; 197
	i32 8, ; 198
	i32 11, ; 199
	i32 109, ; 200
	i32 70, ; 201
	i32 3, ; 202
	i32 63, ; 203
	i32 133, ; 204
	i32 101, ; 205
	i32 119, ; 206
	i32 24, ; 207
	i32 5, ; 208
	i32 129, ; 209
	i32 36, ; 210
	i32 40, ; 211
	i32 134, ; 212
	i32 16, ; 213
	i32 32, ; 214
	i32 87, ; 215
	i32 91, ; 216
	i32 67, ; 217
	i32 33, ; 218
	i32 0, ; 219
	i32 41, ; 220
	i32 112, ; 221
	i32 121, ; 222
	i32 17, ; 223
	i32 111, ; 224
	i32 114, ; 225
	i32 39, ; 226
	i32 66, ; 227
	i32 41, ; 228
	i32 109, ; 229
	i32 4, ; 230
	i32 101, ; 231
	i32 74, ; 232
	i32 136, ; 233
	i32 135, ; 234
	i32 4, ; 235
	i32 12, ; 236
	i32 62, ; 237
	i32 5, ; 238
	i32 46, ; 239
	i32 95, ; 240
	i32 136, ; 241
	i32 53, ; 242
	i32 98, ; 243
	i32 18, ; 244
	i32 43, ; 245
	i32 89, ; 246
	i32 37, ; 247
	i32 52, ; 248
	i32 79, ; 249
	i32 99, ; 250
	i32 131, ; 251
	i32 25, ; 252
	i32 77, ; 253
	i32 104, ; 254
	i32 48, ; 255
	i32 76, ; 256
	i32 98, ; 257
	i32 106, ; 258
	i32 32, ; 259
	i32 99, ; 260
	i32 10, ; 261
	i32 25, ; 262
	i32 8, ; 263
	i32 20, ; 264
	i32 31, ; 265
	i32 75, ; 266
	i32 73, ; 267
	i32 124, ; 268
	i32 126, ; 269
	i32 89, ; 270
	i32 94, ; 271
	i32 93, ; 272
	i32 133, ; 273
	i32 19, ; 274
	i32 76, ; 275
	i32 102, ; 276
	i32 78, ; 277
	i32 14, ; 278
	i32 100, ; 279
	i32 88, ; 280
	i32 84 ; 281
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
