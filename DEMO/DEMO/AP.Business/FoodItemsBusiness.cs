using AP.Data;
using AP.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AP.Business
{
    public class FoodItemsBusiness
    {
        private readonly FoodItemRepository _foodItemRepository;

        public FoodItemsBusiness()
        {
            _foodItemRepository = new FoodItemRepository();
        }

        public IEnumerable<FoodItem> GetFoodItems(int id = 0)
        {
            if (id == 0)
                return _foodItemRepository.GetAll();
            else
                return new List<FoodItem> { _foodItemRepository.GetById(id) };
        }

        public bool SaveOrUpdate(FoodItem foodItem)
        {
            if (foodItem.FoodItemID == 0)
                _foodItemRepository.Add(foodItem);
                //if (ProductValidations.IsWithinTimeRange())
                //  _repositoryProduct.Add(foodItem);
                //else
                //throw new System.Exception("Products cannot be added outside of the allowed time range.");
            else
                _foodItemRepository.Update(foodItem);
            return true;
        }

        public void Delete(int id)
        {
            _foodItemRepository.Delete(id);
        }

        public IEnumerable<FoodItem> SearchProducts(string criteria, string field)
        {
            // language integrated query (LINQ) to filter products based on the specified field and criteria
            var products = GetFoodItems(id: 0);
            switch (field)
            {
                case "Name":
                    return products.Where(p => p.Name.ToLower().Contains(criteria.ToLower()));
                case "Description":
                    return products.Where(p => p.Description.ToLower().Contains(criteria.ToLower()));
                case "Category":
                    return products.Where(p => p.Category.ToLower() != criteria.ToLower());
                case "Brand":
                    return products.Where(p => p.Brand.ToLower() != criteria.ToLower());
                default:
                    return new List<FoodItem>();
            }
        }
    }
}
