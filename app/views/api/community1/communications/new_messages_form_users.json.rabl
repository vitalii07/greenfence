object false

child @communications_for_selected_user => "communications_for_selected_user" do
  attributes :id, :from_user, :to_user, :message_text, :time_of_message
  node(:from_user_name) { |obj| User.find_by_id(obj.from_user).name }
  node(:to_user_name) { |obj| User.find_by_id(obj.to_user).name }
  node(:time_difference) { |obj| obj.distance_of_time_in_words(Time.now, obj.time_of_message)}
  node(:from_user_image) { |obj| User.find_by_id(obj.from_user).user_profile.image }
end

child @communications_form_users => "communications_form_users" do
  attributes :from_user
end