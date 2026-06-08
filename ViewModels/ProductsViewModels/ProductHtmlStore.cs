namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

public static class ProductHtmlStore
{
    public static string GetHtml(string productName)
    {
        return productName switch
        {
            "Keramika və Mozoik yapıştırıcısı" => CommonHtml,
            "Keramika və dekorativ daş yapıştırıcısı" => CommonHtml,
            "Elastik və yüksək performanslı plitə yapıştırıcısı" => CommonHtml,
            "Keramika yapıştırıcısı" => CommonHtml,
            _ => CommonHtml
        };
    }

    private const string CommonHtml = """
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #243B53;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }

        .section-title {
            background: #EAEAEA;
            color: #243B53;
            font-weight: bold;
            font-size: 18px;
            text-transform: uppercase;
            padding: 10px 14px;
            margin: 18px 0 10px 0;
        }

        .sub-title {
            background: #EFEFEF;
            color: #243B53;
            font-weight: bold;
            font-size: 16px;
            padding: 8px 12px;
            margin: 16px 0 10px 0;
        }

        p {
            margin: 0 0 12px 0;
        }

        ul {
            margin: 0 0 12px 20px;
            padding: 0;
        }

        li {
            margin-bottom: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 12px 0 18px 0;
            font-size: 14px;
        }

        th, td {
            border: 1px solid #A7B3C2;
            padding: 10px;
            vertical-align: top;
            text-align: left;
        }

        th {
            background-color: #F1F1F1;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="section-title">Məhsul haqqında</div>
    <p>
        Sement əsaslı, məhsulun istifadə imkanlarını artıran qatqılarla zəngin, yüksək keyfiyyətli,
        hibrid və nano texnologiyalı, kombinasiyalı polimerləşdirilmiş, birkomponentli,
        boz rəngli keramika yapışdırıcısıdır.
    </p>
    <p>
        EN 12004-1 standartının C1TE sinfinin tələblərinə uyğundur.
    </p>

    <div class="section-title">İstifadə sahələri</div>
    <p>Bu keramika yapışdırıcısı:</p>
    <ul>
        <li>daxili və xarici məkanlarda;</li>
        <li>kiçik və orta ölçülü üzlük materialların beton, suvaq, döşəmə suvağı kimi səthlərin üzərinə yapışdırılmasında istifadə olunur.</li>
    </ul>

    <div class="section-title">Üstünlükləri</div>
    <ul>
        <li>Rahat hazırlanır və tətbiq olunur;</li>
        <li>Şaquli və üfüqi səthlərdə sürüşmə ehtimalı yoxdur;</li>
        <li>Şaxtaya və istiliyə davamlıdır.</li>
    </ul>

    <div class="section-title">İstifadə qaydaları</div>
    <p>
        İstifadə olunacaq səthlər sağlam, quru, təmiz və düzgün ölçülü olmalıdır.
        Səth yapışma müqavimətini zəiflədən yağ, parafin və digər qalıqlardan tam təmizlənməlidir.
    </p>

    <div class="sub-title">Qarışığın hazırlanması</div>
    <p>
        25 kq-lıq quru qarışığı 6,0 – 6,5 litr suyun üzərinə boşaldıb kürəciklər yox olana qədər qarışdırın.
        Qarışığın özünü tutması üçün 3–5 dəqiqə gözləyin, istifadəyə başlamazdan əvvəl yenidən qarışdırın.
    </p>

    <div class="section-title">Texniki göstəricilər</div>
    <table>
        <tr>
            <th>Göstərici</th>
            <th>Məlumat</th>
        </tr>
        <tr>
            <td>Rəngi</td>
            <td>boz</td>
        </tr>
        <tr>
            <td>İstifadə temperaturu</td>
            <td>+5° C - +30° C</td>
        </tr>
        <tr>
            <td>İstifadə müddəti</td>
            <td>2 saat</td>
        </tr>
        <tr>
            <td>Qablaşdırma</td>
            <td>10 və 25 kq-lıq kisələrdə</td>
        </tr>
    </table>

</body>
</html>
""";
}