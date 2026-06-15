using AP.Data;

namespace AP.Repositories
{
    /// <summary>
    /// Repository interface for User entities.
    /// Defines the contract for User-specific data access operations.
    /// </summary>
    public interface IRoleRepository : IRepositoryBase<Role>
    {
    }

    /// <summary>
    /// Repository implementation for User entities.
    /// Provides data access operations for User entities using Entity Framework.
    /// </summary>
    public class RoleRepository : RepositoryBase<Role>, IRoleRepository
    {
        /// <summary>
        /// Initializes a new instance of the UserRepository class.
        /// </summary>
        public RoleRepository() : base()
        {
        }
    }
}