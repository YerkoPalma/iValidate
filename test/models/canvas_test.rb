require 'test_helper'

class CanvasTest < ActiveSupport::TestCase
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
  end

  test 'key_partners should be present' do
    @easycount.canvas.key_partners = nil
    assert_not @easycount.canvas.valid?
    @easycount.canvas.key_partners = { description: 'New key partners',
                                tags: %w[my partners tags] }
    assert @easycount.canvas.valid?, @easycount.errors.full_messages[0]
  end

  test 'key_partners should have description and tags properly set' do
    # description must be a string
    assert_not @easycount.canvas.key_partners[:description].nil?
    assert_instance_of String, @easycount.canvas.key_partners[:description]
    @easycount.canvas.key_partners[:description] = 0
    assert_not @easycount.canvas.valid?

    # tags should be an array of strings
    assert_not @easycount.canvas.key_partners[:tags].nil?
    assert_instance_of Array, @easycount.canvas.key_partners[:tags]
    @easycount.canvas.key_partners[:tags] = [0, 1, 2]
    assert_not @easycount.canvas.valid?

    # tags can not be repeated
    @easycount.canvas.key_partners[:tags] = %w[tag1 tag2 tag1]
    assert_not @easycount.canvas.valid?
  end

  test 'key_activities should be present' do
  end

  test 'key_activities should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'key_resources should be present' do
  end

  test 'key_resources should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'value_propositions should be present' do
  end

  test 'value_propositions should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'customer_relationships should be present' do
  end

  test 'customer_relationships should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'channels should be present' do
  end

  test 'channels should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'customer_segments should be present' do
  end

  test 'customer_segments should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'cost_structures should be present' do
  end

  test 'cost_structures should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end

  test 'revenue_streams should be present' do
  end

  test 'revenue_streams should have description and tags properly set' do
    # description must be a string
    # tags should be an array of strings
    # tags can be repeated
  end
end
