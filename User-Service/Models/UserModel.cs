namespace User_Service.Models;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
public class UserModel
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id {get; set; }
    
    [BsonElement("Name")] public string Name { get; set; } = null!;

    [BsonElement("Username")] public string Username { get; set; } = null!;
}