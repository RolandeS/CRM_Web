class Rolodex
	attr_reader :contacts
	
	def initialize
		@contacts = []
		@@ids = 1001
	end

	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		# contact
	end

	def modify_contact(id, num, new_value)
		index = @contacts.index(id).to_i
		contact = @contacts[index]
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
	
	def display_particular_contact(id)
		 index = @contacts.index(id)
		 @contacts [index.to_i]
	end

	def display_info_by_attribute(id, num)
		index = @contacts.index(id)
		contact = @contacts[index.to_i]

		case num
		when 1 then return contact.first_name
		when 2 then return contact.last_name
		when 3 then return contact.email
		when 4 then return contact.note
		else puts "Done"
			return
		end
	end

	def delete_contact(id)
		index = @contacts.index(id).to_i
		@contacts.delete_at(index)
	end
end