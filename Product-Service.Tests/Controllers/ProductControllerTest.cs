using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Product_Service.Controllers;
using Product_Service.Models;
using Product_Service.Services;
using Xunit;

namespace Product_Service.Tests.Controllers
{
    public class ProductControllerTests
    {
        [Fact]
        public async Task Get_ReturnsNotFound_WhenProductDoesNotExist()
        {
            // Arrange
            var productServiceMock = new Mock<IProductService>();
            productServiceMock.Setup(x => x.GetAsync(It.IsAny<string>())).ReturnsAsync(null as ProductModel);
            var controller = new ProductController(productServiceMock.Object);

            // Act
            var result = await controller.Get("nonExistingId");

            // Assert
            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Get_ReturnsOk_WhenProductExists()
        {
            // Arrange
            var existingProduct = new ProductModel { Id = "existingId", Name = "Product Name", Price = 1099 };
            var productServiceMock = new Mock<IProductService>();
            productServiceMock.Setup(x => x.GetAsync("existingId")).ReturnsAsync(existingProduct);
            var controller = new ProductController(productServiceMock.Object);

            // Act
            var result = await controller.Get("existingId");

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result);
            var returnedProduct = Assert.IsType<ProductModel>(okResult.Value);
            Assert.Equal(existingProduct, returnedProduct);
        }

        [Fact]
        public async Task GetAllProducts_ReturnsNotFound_WhenNoProductsExist()
        {
            // Arrange
            var productServiceMock = new Mock<IProductService>();
            productServiceMock.Setup(x => x.GetAsync()).ReturnsAsync(new List<ProductModel>());
            var controller = new ProductController(productServiceMock.Object);

            // Act
            var result = await controller.GetAllProducts();

            // Assert
            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task GetAllProducts_ReturnsOk_WhenProductsExist()
        {
            // Arrange
            var existingProducts = new List<ProductModel>
            {
                new ProductModel { Id = "1", Name = "Product 1", Price = 1099 },
                new ProductModel { Id = "2", Name = "Product 2", Price = 2099 }
            };
            var productServiceMock = new Mock<IProductService>();
            productServiceMock.Setup(x => x.GetAsync()).ReturnsAsync(existingProducts);
            var controller = new ProductController(productServiceMock.Object);

            // Act
            var result = await controller.GetAllProducts();

            // Assert
            var okResult = Assert.IsType<OkObjectResult>(result);
            var products = Assert.IsAssignableFrom<IEnumerable<ProductModel>>(okResult.Value);
            Assert.Equal(existingProducts, products);
        }
    }
}
