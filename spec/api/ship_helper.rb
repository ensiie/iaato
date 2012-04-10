def it_should_be_a_ship
  its(:body) { should have_json_path('_id') }
  its(:body){ should have_json_type(String).at_path('name') }
  its(:body){ should be_json_eql(%("concordia")).at_path('name') }
  its(:body){ should have_json_type(Integer).at_path('capacity') }
  its(:body){ should be_json_eql(200).at_path('capacity') }
  its(:body){ should have_json_type(Integer).at_path('travelers') }
  its(:body){ should be_json_eql(0).at_path('travelers') }
  its(:body){ should be_json_eql(:null).at_path('position') }
end
