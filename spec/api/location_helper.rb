def it_should_be_a_location(path = "")
  its(:body){ should have_json_path("#{path}id") }
  its(:body){ should have_json_type(String).at_path("#{path}name") }
  its(:body){ should have_json_type(Integer).at_path("#{path}capacity") }
  its(:body){ should have_json_type(Array).at_path("#{path}coordinates") }
  its(:body){ should have_json_type(Integer).at_path("#{path}coordinates/0") }
  its(:body){ should have_json_type(Integer).at_path("#{path}coordinates/1") }
end

def its_name_should_be(name, path = "")
  its(:body) { should be_json_eql(%("#{name}")).at_path("#{path}name") }
end

def its_capacity_should_be(capacity, path = "")
  its(:body) { should be_json_eql(capacity).at_path("#{path}capacity") }
end

