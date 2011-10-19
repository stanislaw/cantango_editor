class Guest

  def roles_list
    [:guest]
  end

  def has_role? role
    role == :guest
  end

  def email
    'guest@gmail.com'
  end
end
