using AP.Data;

namespace AP.Repositories
{
    /// <summary>
    /// Repository interface for User entities.
    /// Defines the contract for User-specific data access operations.
    /// </summary>
    public interface IUserRoleRepository : IRepositoryBase<UserRole>
    {
    }

    /// <summary>
    /// Repository implementation for User entities.
    /// Provides data access operations for User entities using Entity Framework.
    /// </summary>
    public class UserRoleRepository : RepositoryBase<UserRole>, IUserRoleRepository
    {
        /// <summary>
        /// Initializes a new instance of the UserRepository class.
        /// </summary>
        public UserRoleRepository() : base()
        {
        }
    }
}