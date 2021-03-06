require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  def setup
    # to prevent duplicate ideas
    Idea.delete_all
    @easycount = build(:easycount)
  end

  test 'should be valid' do
    assert @easycount.valid?, @easycount.errors.full_messages[0]
  end

  test 'should not save blank ideas' do
    blank_idea = Idea.new
    assert_not blank_idea.save, 'Saved empty idea'

    # error message should say what fields are required
    assert_not_empty blank_idea.errors
    assert_includes blank_idea.errors, :name
    assert_includes blank_idea.errors, :contact
  end

  test 'name should be present' do
    @easycount.name = nil
    assert_not @easycount.valid?
    assert_includes @easycount.errors, :name
    @easycount.name = 'NewName'
    assert @easycount.valid?, @easycount.errors.full_messages[0]
  end

  test 'contact should be present' do
    @easycount.contact = nil
    assert_not @easycount.valid?
    assert_includes @easycount.errors, :contact
    @easycount.contact = 'new@mail.com'
    assert @easycount.valid?
  end

  test 'contact should be a valid email address' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @easycount.contact = invalid_address
      assert_not @easycount.valid?, "#{invalid_address.inspect} should be invalid for contact"
      assert_includes @easycount.errors, :contact
    end
  end

  test 'name should be unique' do
    duplicate_idea = @easycount.dup
    duplicate_idea.name = @easycount.name.upcase
    @easycount.save
    assert_not duplicate_idea.valid?
    assert_includes duplicate_idea.errors, :name
  end

  test 'avatar should be a valid base64 string or image url' do
    invalid_avatars = %w[some_file.pdf otherfile.doc notAbase64stringg
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_avatars.each do |invalid_avatar|
      @easycount.avatar = invalid_avatar
      assert_not @easycount.valid?, "#{invalid_avatar.inspect} is not a valid <img> source"
      assert_includes @easycount.errors, :avatar
    end
    valid_avatars = %w[YW55IGNhcm5hbCBwbGVhc3VyZS4= YW55IGNhcm5hbCBwbGVhc3VyZQ==
                      YW55IGNhcm5hbCBwbGVhc3Vy http://placehold.it/230x150
                      http://placehold.it/230x150.jpg]
    valid_avatars.each do |valid_avatar|
      @easycount.avatar = valid_avatar
      assert @easycount.valid?, "#{valid_avatar.inspect} is a valid <img> source"
    end
  end

  test 'tags should be an array of strings' do
    assert_instance_of Array, @easycount.tags
    assert_raises Mongoid::Errors::InvalidValue do
      @easycount.tags = '' # can not be a string, even if there is only one tag
    end

    # must be an array of strings, any other data type is invalid
    @easycount.tags = [1, 2, 3]
    assert_not @easycount.valid?
    assert_includes @easycount.errors, :tags
  end

  test 'the tags array should not have duplicate values' do
    @easycount.tags = %w[tag1 tag2 tag1]
    assert_not @easycount.valid?
    assert_includes @easycount.errors, :tags
  end
end
