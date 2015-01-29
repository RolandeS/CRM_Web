class Rolodex
	attr_reader :contacts
	
	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
		contact
	end

	def modify_contact(contact_id, num, new_value)
		contact = @contacts.find {|contact| contact.id == contact_id }
		
		case num
		when 1 then contact.first_name = new_value.to_s
		when 2 then contact.last_name = new_value.to_s
		when 3 then contact.email = new_value.to_s
		when 4 then contact.note = new_value.to_s
		else puts "Move on"
			return
		end
		contact
	end

	def display_all_contacts
		@contacts
	end
	
	def display_particular_contact(contact_id)

		@contacts.find {|contact| contact.id == contact_id }

	end

	def display_info_by_attribute(contact_id, num)
		
		contact = @contacts.find {|contact| contact.id == contact_id }

		case num
		when 1 then return contact.first_name
		when 2 then return contact.last_name
		when 3 then return contact.email
		when 4 then return contact.note
		else puts "Done"
			return
		end
	end

	def delete_contact(contact_id)
		
		contact = @contacts.find {|contact| contact.id == contact_id }
		index = @contacts.index(contact).to_i
		@contacts.delete_at(index)
	end
end