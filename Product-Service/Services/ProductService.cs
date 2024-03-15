using Microsoft.Extensions.Options;
using MongoDB.Driver;
using Product_Service.Configurations;
using Product_Service.Models;

namespace Product_Service.Services
{
    public interface IProductService
    {
        Task<List<ProductModel>> GetAsync();
        Task<ProductModel> GetAsync(string id);
        Task CreateAsync(ProductModel productModel);
        Task UpdateAsync(ProductModel productModel);
        Task RemoveAsync(string id);
    }

    public class ProductService : IProductService
    {
        private readonly IMongoCollection<ProductModel> _productCollection;

        public ProductService(IOptions<DatabaseSettings> databaseSettings)
        {
            var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
            var mongoDb = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
            _productCollection = mongoDb.GetCollection<ProductModel>(databaseSettings.Value.CollectionName);
        }

        public async Task<List<ProductModel>> GetAsync() => await _productCollection.Find(_ => true).ToListAsync();

        public async Task<ProductModel> GetAsync(string id) =>
            await _productCollection.Find(x => x.Id == id).FirstOrDefaultAsync();

        public async Task CreateAsync(ProductModel productModel) => await _productCollection.InsertOneAsync(productModel);

        public async Task UpdateAsync(ProductModel productModel) =>
            await _productCollection.ReplaceOneAsync(x => x.Id == productModel.Id, productModel);

        public async Task RemoveAsync(string id) => await _productCollection.DeleteOneAsync(x => x.Id == id);
    }
}