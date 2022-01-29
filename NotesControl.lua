NotesControl = Class{}

function NotesControl:init(note_width, note_length)
    self.current_time = 0
    self.current_note = 0
    self.time_interval = 0
    self.hit_area_high = 0
    self.hit_area_low = 0
    self.notes_sequence_array = {0,1,0,1,1,0}
    self.notes_array = {}
    self.NOTE_WIDTH = note_width
    self.NOTE_LENGTH = note_length
end

function NotesControl:notes_control_update(dt)
    self.current_time = self.current_time + dt
    if self.current_time % self.time_interval == 0 then
        self.next_note()
    end
end

function NotesControl:next_note()
    if self.notes_array[self.current_note] then
        self.notes_array[self.current_note] = Note(0, self.NOTE_WIDTH, self.NOTE_LENGTH)
    self.current_note = self.current_note + 1;
end