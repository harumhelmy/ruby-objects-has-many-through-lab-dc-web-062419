class Doctor

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(patient, self, date)
    end

    def appointments
        Appointment.all.select { |appt| appt.doctor == self }
    end

    def patients
        self.appointments.map { |appt| appt.patient }
    end

end
