require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it 'should switch complete to false if it began as true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  describe '#toggle_favorite!'
    it 'should switch favorite to false if it began as true' do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it 'should switch favorite to true if it began as false' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return true if Time.now > deadline!' do
      task = Task.new(deadline: Time.now - 2.hours)
      expect(task.overdue?).to eq(true)
    end

    it 'should return true if Time.now > deadline!' do
      task = Task.new(deadline: Time.now + 2.hours)
      expect(task.overdue?).to eq(false)
    end
  end
end
