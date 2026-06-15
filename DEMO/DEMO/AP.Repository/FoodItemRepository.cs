using AP.Data;

namespace AP.Repositories
{
    /// <summary>
    /// Repository interface for FoodItem entities.
    /// Defines the contract for FoodItem-specific data access operations.
    /// </summary>
    public interface IFoodItemRepository : IRepositoryBase<FoodItem>
    {
    }

    /// <summary>
    /// Repository implementation for FoodItem entities.
    /// Provides data access operations for FoodItem entities using Entity Framework.
    /// </summary>
    public class FoodItemRepository : RepositoryBase<FoodItem>, IFoodItemRepository
    {
        /// <summary>
        /// Initializes a new instance of the FoodItemRepository class.
        /// </summary>
        public FoodItemRepository() : base()
        {
        }
    }
}
