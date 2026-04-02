package sanpham;
public class products {
    private int id;
    private String name;
    private double price;
    private String image;
    private int brand;
    private String description;

    public products() {
    }

    public products(int id, String name, double price, String image, int brand, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.brand = brand;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public int getBrand() {
        return brand;
    }

    public void setBrand(int brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

    @Override
    public String toString() {
        return "products{" + "id=" + id + ", name=" + name + ", price=" + price + ", image_url=" + image + ", brand=" + brand + " , description=" + description + '}';
    }
    
    
}
