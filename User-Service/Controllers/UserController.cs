using Microsoft.AspNetCore.Mvc;
using User_Service.Models;
using User_Service.Services;

namespace User_Service.Controllers;

[ApiController]
[Route("/api/[controller]")]
public class UserController : ControllerBase
{
    private readonly UserService _userService;
    public UserController(UserService userService) => _userService = userService;

    [HttpGet("{id:length(24)}")]
    public async Task<IActionResult> Get(string id)
    {
        var existingUser = await _userService.GetAsync(id);
        if (existingUser is null)
            return NotFound();
    
        return Ok(existingUser);
    }

    [HttpGet]
    public async Task<IActionResult> GetAllUser()
    {
        var users = await _userService.GetAsync();
        if (users.Any())
            return Ok(users);

        return NotFound();
    }
    
    
    [HttpPost]
    public async Task<IActionResult> PostUser(UserModel userModel)
    {
        await _userService.CreateAsync(userModel);
        return CreatedAtAction(nameof(Get), new { id = userModel.Id }, userModel);
    }
    
    [HttpPut("{id:length(24)}")]
    public async Task<IActionResult> UpdateUser(String id, UserModel userModel)
    {
        var existingUser = await _userService.GetAsync(id);
        if (existingUser is null)
            return BadRequest();
    
        userModel.Id = existingUser.Id;
    
        await _userService.UpdateAsync(userModel);
        return Ok();
    }
    
    [HttpDelete("{id:length(24)}")]
    public async Task<IActionResult> DeleteUser(String id)
    {
        var existingUser = await _userService.GetAsync(id);
        if (existingUser is null)
            return BadRequest();
    
        await _userService.RemoveAsync(id);
    
        return NoContent();
    }
    
}