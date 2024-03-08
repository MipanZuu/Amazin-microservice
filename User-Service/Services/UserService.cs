using User_Service.Configuration;
using User_Service.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace User_Service.Services;

public class UserService
{
    private readonly IMongoCollection<UserModel> _userCollection;

    public UserService(IOptions<DatabaseSettings> databaseSettings)
    {
        var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
        var mongoDb = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
        _userCollection = mongoDb.GetCollection<UserModel>(databaseSettings.Value.CollectionName);
    }

    public async Task<List<UserModel>> GetAsync() => await _userCollection.Find(_ => true).ToListAsync();

    public async Task<UserModel> GetAsync(string id) =>
        await _userCollection.Find(x => x.Id == id).FirstOrDefaultAsync();

    public async Task CreateAsync(UserModel userModel) => await _userCollection.InsertOneAsync(userModel);

    public async Task UpdateAsync(UserModel userModel) =>
        await _userCollection.ReplaceOneAsync(x => x.Id == userModel.Id, userModel);

    public async Task RemoveAsync(string id) => await _userCollection.DeleteOneAsync(x => x.Id == id);
}