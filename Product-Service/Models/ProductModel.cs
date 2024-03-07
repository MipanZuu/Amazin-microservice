using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Product_Service.Models;

public class ProductModel
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id {get; set; }
    
    [BsonElement("Name")] public string Name { get; set; } = null!;

    [BsonElement("Description")] public string Description { get; set; } = null!;
    
    [BsonElement("Price")]
    public int Price {get; set; }
}