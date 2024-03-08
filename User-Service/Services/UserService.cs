using User_Service.Configuration;
using User_Service.Models;

namespace User_Service.Services;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

public class UserService
{
    private readonly IMongoCollection<UserModel> _productCollection;

    public UserService(IOptions<DatabaseSettings> databaseSettings)
    {
        var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
        var mongoDb = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
        _productCollection = mongoDb.GetCollection<UserModel>(databaseSettings.Value.CollectionName);
    }

    public async Task<List<UserModel>> GetAsync() => await _productCollection.Find(_ => true).ToListAsync();

    public async Task<UserModel> GetAsync(string id) =>
        await _productCollection.Find(x => x.Id == id).FirstOrDefaultAsync();

    public async Task CreateAsync(UserModel productModel) => await _productCollection.InsertOneAsync(productModel);

    public async Task UpdateAsync(UserModel productModel) =>
        await _productCollection.ReplaceOneAsync(x => x.Id == productModel.Id, productModel);

    public async Task RemoveAsync(string id) => await _productCollection.DeleteOneAsync(x => x.Id == id);
}