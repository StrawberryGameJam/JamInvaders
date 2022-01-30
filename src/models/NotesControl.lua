require 'src/models/Note'
require 'src/utils/check_collision'

NotesControl = Class{}

function NotesControl:init(note_width, note_length, window_height, window_width, hit_area_length)
    self.current_time = 0
    self.current_note = 1
    self.current_interval = 1
    self.time_interval = 0.5
    self.hit_area_low = window_height - 10
    self.hit_area_high = window_height - hit_area_length - 10
    self.notes_sequence_array = {0,1,1,1,0,1,0,0,0,0}
    self.notes_array = {}
    self.NOTE_WIDTH = note_width
    self.NOTE_LENGTH = note_length
    self.WINDOW_HEIGHT = window_height
    self.WINDOW_WIDTH = window_width
end

function NotesControl:update(dt)
    self.current_time = self.current_time + dt
    if (self.current_time >= (self.current_note-1)*self.time_interval) then
        self:next_note()
    end
    for note_index = 1, #self.notes_array do
        print(note_index)
        if check_collision(self.hit_area_low, self.hit_area_high,
            self.notes_array[note_index].y, self.notes_array[note_index].width)
            and love.keyboard.wasPressed('space')
            then
                print("note hit!")
                table.remove(self.notes_array, note_index)
        self.notes_array[note_index].update_position(dt)
        end
    end
end

function NotesControl:render()
    for note_index = 1, #self.notes_array do
        -- print(self.notes_array[note_index].y)
        self.notes_array[note_index].render()
    end
    -- self:render_hit_area()
end

function NotesControl:render_hit_area()
    love.graphics.rectangle('line', 0, self.hit_area_high, self.WINDOW_WIDTH-10, self.WINDOW_HEIGHT-10, self.height)
end

function NotesControl:next_note()
    if self.current_interval <= #self.notes_sequence_array and self.notes_sequence_array[self.current_interval] == 1 then
        self.notes_array[self.current_note] = Note(0, self.NOTE_WIDTH, self.NOTE_LENGTH)
        self.current_note = self.current_note + 1;
    end
    self.current_interval = self.current_interval + 1;
end
