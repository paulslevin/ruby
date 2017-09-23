def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cheddar)
  pet_shop[:admin][:total_cash] += cheddar
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets)
  pet_shop[:admin][:pets_sold] +=pets
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  all_pets = pet_shop[:pets]
  all_pets.select { |pet| pet[:breed] == breed }
end

def find_pet_by_name(pet_shop, pet_name)
  all_pets = pet_shop[:pets]
  all_pets.find { |pet| pet[:name] == pet_name }
end

def remove_pet_by_name(pet_shop, pet_name)
  all_pets = pet_shop[:pets]
  all_pets.delete_if { |pet| pet[:name] == pet_name }
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  cash = customer[:cash]
  price = new_pet[:price]
  cash < price ? false : true
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet and customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end

end
