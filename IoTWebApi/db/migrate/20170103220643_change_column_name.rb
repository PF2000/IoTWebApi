class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	 rename_column :school_years, :startTime, :start_time
  	 rename_column :school_years, :endTime, :end_time
  	 rename_column :schools, :distric, :district
  	 rename_column :schools, :postCode, :post_code
  	 rename_column :schools, :addressDetails, :address_details
	 rename_column :school_classes, :startTime, :start_time
  	 rename_column :school_classes, :endTime, :end_time
  	 rename_column :school_classes, :classLetter, :class_letter
  	 rename_column :school_classes, :classType, :class_type
  end
end
