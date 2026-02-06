namespace MetanetA_MobileApp.Model
{
    public class SalesItem
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();

        public string Name { get; set; }
        public string Category { get; set; }   // Məs: "Fasad boyaları"
        public string Weight { get; set; }     // Məs: "3.5 Kg"

        public decimal Price { get; set; }
        public decimal? OldPrice { get; set; }

        // şəkil adları: "pic1", "pic2" ...
        public string Image { get; set; }

        public string Description { get; set; }
    }
}
