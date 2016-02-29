require 'test_helper'

class CanvasTest < ActiveSupport::TestCase
  @canvas_properties = %w[key_partners key_activities key_resources 
                            value_propositions customer_relationships channels 
                            customer_segments cost_structures revenue_streams]
  def setup
    # to prevent duplicate ideas
    Idea.delete_all
    @easycount = build(:easycount)

    # saved idea doesn't have a canvas model
    @easycount.save
    @easycount_canvas = build(:easycount_canvas)
    @easycount.canvas = @easycount_canvas
  end

  test 'should be valid' do
    assert @easycount_canvas.valid?, @easycount_canvas.errors.full_messages[0]
  end

  test 'should not save blank canvas' do
    blank_canvas = Canvas.new
    @easycount.canvas = blank_canvas
    assert_not @easycount.save, 'Saved empty idea'
    assert_not_empty @easycount.canvas.errors
    assert_includes @easycount.canvas.errors, :key_partners
  end

  @canvas_properties.each do |property|
    test "#{property} should be present" do
      # all properties are required
      @easycount.canvas[property] = nil
      assert_not @easycount.canvas.valid?
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      @easycount.canvas[property] = { description: 'New key partners',
                                  tags: %w[my partners tags] }
      assert @easycount.canvas.valid?, @easycount.errors.full_messages[0]
    end
    
    test "#{property} description should be a string" do
      # all properties must have a description
      @easycount.canvas[property][:description] = nil
      assert_not @easycount.canvas.valid?, @easycount.canvas.errors.full_messages.to_json
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      # descriptions can't be numbers
      @easycount.canvas[property][:description] = 1
      assert_not @easycount.canvas.valid?, @easycount.canvas.errors.full_messages.to_json
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      @easycount.canvas[property][:description] = 'Valid description'
      assert @easycount.canvas.valid?, @easycount.canvas.errors.full_messages.to_json
      assert_instance_of String, @easycount.canvas[property][:description]
    end

    test "#{property} tags should be an array of strings" do
      # all properties must have tags
      @easycount.canvas[property][:tags] = nil
      assert_not @easycount.canvas.valid?, 'tags not present'
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      # tags can't be strings
      @easycount.canvas[property][:tags] = 'not valid tag value'
      assert_not @easycount.canvas.valid?, 'tags must be arrays'
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      # tags must be arrays...
      @easycount.canvas[property][:tags] = []
      assert_instance_of Array, @easycount.canvas[property][:tags]
      # ...non empty arrays
      assert_not @easycount.canvas.valid?, 'there must be at least one tag'
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      # ..of strings
      @easycount.canvas[property][:tags] = [0, 1, 2]
      assert_not @easycount.canvas.valid?, 'tags should be strings'
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
    end

    test "#{property} tags must be unique" do
      @easycount.canvas[property][:tags] = %w[tag1 tag2 tag1]
      assert_not @easycount.canvas.valid?
      assert_includes @easycount.canvas.errors.messages.keys, property.to_sym
      @easycount.canvas[property][:tags] = %w[this are valid tags]
      assert @easycount.canvas.valid?
    end
  end
end
