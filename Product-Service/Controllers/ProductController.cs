using Microsoft.AspNetCore.Mvc;
using Product_Service.Models;
using Product_Service.Services;

namespace Product_Service.Controllers;


[ApiController]
[Route("/api/[controller]")]
public class ProductController : ControllerBase
{
    private readonly IProductService _productService;
    public ProductController(IProductService productService) => _productService = productService;

    [HttpGet("{id:length(24)}")]
    public async Task<IActionResult> Get(string id)
    {
        var existingProduct = await _productService.GetAsync(id);
        if (existingProduct is null)
            return NotFound();

        return Ok(existingProduct);
    }

    [HttpGet]
    public async Task<IActionResult> GetAllProducts()
    {
        var allProducts = await _productService.GetAsync();
        if (allProducts.Any())
            return Ok(allProducts);

        return NotFound();
    }
    

    [HttpPost]
    public async Task<IActionResult> PostProduct(ProductModel productModel)
    {
        await _productService.CreateAsync(productModel);
        return CreatedAtAction(nameof(Get), new { id = productModel.Id }, productModel);
    }

    [HttpPut("{id:length(24)}")]
    public async Task<IActionResult> UpdateProduct(String id, ProductModel productModel)
    {
        var existingProduct = await _productService.GetAsync(id);
        if (existingProduct is null)
            return BadRequest();

        productModel.Id = existingProduct.Id;

        await _productService.UpdateAsync(productModel);
        return Ok();
    }

    [HttpDelete("{id:length(24)}")]
    public async Task<IActionResult> DeleteProduct(String id)
    {
        var existingProduct = await _productService.GetAsync(id);
        if (existingProduct is null)
            return BadRequest();

        await _productService.RemoveAsync(id);

        return NoContent();
    }
}