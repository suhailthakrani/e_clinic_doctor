class User {
  String id = '';
  String first_name = '';
  String last_name = '';
  String email = '';
  String? phone;
  String gender = '';
  String? image;
  bool email_verified = false;
  bool phone_verified = false;
  bool profile_setup = false;
  String role = 'PATIENT';
  String password = '';
  DateTime created_at = DateTime.now();
  DateTime updated_at = DateTime.now();
  Patient? patient;
  Doctor? doctor;

  User({
    this.id = '',
    this.first_name = '',
    this.last_name = '',
    this.email = '',
    this.phone,
    this.gender = '',
    this.image,
    this.email_verified = false,
    this.phone_verified = false,
    this.profile_setup = false,
    this.role = 'PATIENT',
    this.password = '',
    required this.created_at,
    required this.updated_at,
    this.patient,
    this.doctor,
  });
  User.empty()
      : id = '',
        first_name = '',
        last_name = '',
        email = '',
        phone = '',
        gender = '',
        image = '',
        email_verified = false,
        phone_verified = false,
        profile_setup = false,
        role = 'PATIENT',
        password = '',
        created_at = DateTime.now(),
        updated_at = DateTime.now(),
        patient = null,
        doctor = null;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      first_name: json['first_name'] ?? '',
      last_name: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      gender: json['gender'] ?? '',
      image: json['image'],
      email_verified: json['email_verified'] ?? false,
      phone_verified: json['phone_verified'] ?? false,
      profile_setup: json['profile_setup'] ?? false,
      role: json['role'] ?? 'PATIENT',
      password: json['password'] ?? '',
      created_at: DateTime.parse(json['created_at'] ?? ''),
      updated_at: DateTime.parse(json['updated_at'] ?? ''),
      patient: json['patient'] != null ? Patient.fromJson(json['patient']) : null,
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'image': image,
      'email_verified': email_verified,
      'phone_verified': phone_verified,
      'profile_setup': profile_setup,
      'role': role,
      'password': password,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
      'patient': patient?.toJson(),
      'doctor': doctor?.toJson(),
    };
  }
}

class Patient {
  String id = '';
  DateTime birthdate = DateTime.now();
  late User user;
  String userId = '';
  late List<Appointment> appointment;
  late List<Review> Reviews;
  late List<Transactions> transactions;

  Patient({
    this.id = '',
    required this.birthdate,
    required this.user,
    this.userId = '',
    List<Appointment>? appointment,
    List<Review>? Reviews,
    List<Transactions>? transactions,
  })  : appointment = appointment ?? [],
        Reviews = Reviews ?? [],
        transactions = transactions ?? [];

        Patient.empty()
      : id = '',
        birthdate = DateTime.now(),
        user = User.empty(),
        userId = '',
        appointment = [],
        Reviews = [],
        transactions = [];

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      birthdate: DateTime.parse(json['birthdate'] ?? ''),
      user: User.fromJson(json['user']),
      userId: json['userId'] ?? '',
      appointment: (json['Appointment'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e))
          .toList() ??
          [],
      Reviews: (json['Reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e))
          .toList() ??
          [],
      transactions: (json['Transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'birthdate': birthdate.toIso8601String(),
      'user': user.toJson(),
      'userId': userId,
      'Appointment': appointment.map((e) => e.toJson()).toList(),
      'Reviews': Reviews.map((e) => e.toJson()).toList(),
      'Transactions': transactions.map((e) => e.toJson()).toList(),
    };
  }
}

class Doctor {
  String id = '';
  String specialization = '';
  String hospital_clinic_name = '';
  String verification = 'PENDING';
  String? about;
  late Location location;
  late User user;
  List<String> appointment_types_allowed = ['PHYSICAL'];
  late List<Document> degree;
  late List<Schedule> schedule;
  late List<Charges> charges;
  late List<Appointment> appointment;
  late List<Review> reviews;
  late List<Transactions> transactions;

  Doctor({
    this.id = '',
    this.specialization = '',
    this.hospital_clinic_name = '',
    this.verification = 'PENDING',
    this.about,
    required this.location,
    required this.user,
    List<String>? appointment_types_allowed,
    List<Document>? degree,
    List<Schedule>? schedule,
    List<Charges>? charges,
    List<Appointment>? appointment,
    List<Review>? reviews,
    List<Transactions>? transactions,
  }) {
    this.appointment_types_allowed = appointment_types_allowed ?? ['PHYSICAL'];
    this.degree = degree ?? [];
    this.schedule = schedule ?? [];
    this.charges = charges ?? [];
    this.appointment = appointment ?? [];
    this.reviews = reviews ?? [];
    this.transactions = transactions ?? [];
  }

  Doctor.empty()
      : id = '',
        specialization = '',
        hospital_clinic_name = '',
        verification = 'PENDING',
        about = '',
        location = Location.empty(),
        user = User.empty(),
        appointment_types_allowed = ['PHYSICAL'],
        degree = [],
        schedule = [],
        charges = [],
        appointment = [],
        reviews = [],
        transactions = [];

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      specialization: json['specialization'] ?? '',
      hospital_clinic_name: json['hospital_clinic_name'] ?? '',
      verification: json['verification'] ?? 'PENDING',
      about: json['about'],
      location: Location.fromJson(json['location']),
      user: User.fromJson(json['user']),
      appointment_types_allowed: (json['appointment_types_allowed'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          ['PHYSICAL'],
      degree: (json['degree'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e))
          .toList() ??
          [],
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e))
          .toList() ??
          [],
      charges: (json['charges'] as List<dynamic>?)
          ?.map((e) => Charges.fromJson(e))
          .toList() ??
          [],
      appointment: (json['appointment'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e))
          .toList() ??
          [],
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e))
          .toList() ??
          [],
      transactions: (json['Transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization,
      'hospital_clinic_name': hospital_clinic_name,
      'verification': verification,
      'about': about,
      'location': location.toJson(),
      'user': user.toJson(),
      'appointment_types_allowed': appointment_types_allowed,
      'degree': degree.map((e) => e.toJson()).toList(),
      'schedule': schedule.map((e) => e.toJson()).toList(),
      'charges': charges.map((e) => e.toJson()).toList(),
      'appointment': appointment.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'Transactions': transactions.map((e) => e.toJson()).toList(),
    };
  }
}

class Document {
  String id = '';
  String type = 'DEGREE';
  String name = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';

  Document({
    this.id = '',
    this.type = 'DEGREE',
    this.name = '',
    required this.doctor,
    this.doctorId = '',
  });

  Document.empty()
      : id = '',
        type = 'DEGREE',
        name = '',
        doctor = Doctor.empty(),
        doctorId = '';

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] ?? '',
      type: json['type'] ?? 'DEGREE',
      name: json['name'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}

class Location {
  String id = '';
  String address = '';
  String city = '';
  String state = '';
  Doctor doctor = Doctor.empty();

  Location({
    this.id = '',
    this.address = '',
    this.city = '',
    this.state = '',
    required this.doctor,
  });

  Location.empty()
      : id = '',
        address = '',
        city = '',
        state = '',
        doctor = Doctor.empty();

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      doctor: json['Doctor'] != null ? Doctor.fromJson(json['Doctor']) : Doctor.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'city': city,
      'state': state,
      'Doctor': doctor.toJson(),
    };
  }
}

class Schedule {
  String id = '';
  String day = '';
  String startTime = '';
  String endTime = '';
  String? break_start;
  String? break_end;
  int buffer = 0;
  bool is_active = false;
  int appointment_interval = 0;
  late Doctor doctor;
  String doctorId = '';

  Schedule({
    this.id = '',
    this.day = '',
    this.startTime = '',
    this.endTime = '',
    this.break_start,
    this.break_end,
    this.buffer = 0,
    this.is_active = false,
    this.appointment_interval = 0,
    required this.doctor,
    this.doctorId = '',
  });
  Schedule.empty()
      : id = '',
        day = '',
        startTime = '',
        endTime = '',
        break_start = '',
        break_end = '',
        buffer = 0,
        is_active = false,
        appointment_interval = 0,
        doctor = Doctor.empty(),
        doctorId = '';

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'] ?? '',
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      break_start: json['break_start'],
      break_end: json['break_end'],
      buffer: json['buffer'] ?? 0,
      is_active: json['is_active'] ?? false,
      appointment_interval: json['appointment_interval'] ?? 0,
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'break_start': break_start,
      'break_end': break_end,
      'buffer': buffer,
      'is_active': is_active,
      'appointment_interval': appointment_interval,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}

class Charges {
  String id = '';
  int amount = 0;
  String appointment_type = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';

  Charges({
    this.id = '',
    this.amount = 0,
    this.appointment_type = '',
    required this.doctor,
    this.doctorId = '',
  });
  Charges.empty()
      : id = '',
        amount = 0,
        appointment_type = '',
        doctor = Doctor.empty(),
        doctorId = '';

  factory Charges.fromJson(Map<String, dynamic> json) {
    return Charges(
      id: json['id'] ?? '',
      amount: json['amount'] ?? 0,
      appointment_type: json['appointment_type'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'appointment_type': appointment_type,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
    };
  }
}

class Appointment {
  String id = '';
  DateTime date = DateTime.now();
  String time = '';
  int charges = 0;
  String type = '';
  String patient_name = '';
  String message = '';
  Doctor doctor = Doctor.empty();
  String doctorId = '';
  Patient patient = Patient.empty();
  String patientId = '';
  String status = 'PENDING';
  bool completed = false;
  String payment_status = 'PENDING';
  List<Transactions> transactions = [];
  List<Prescription> prescription = [];

  Appointment({
    this.id = '',
    required this.date,
    this.time = '',
    this.charges = 0,
    this.type = '',
    this.patient_name = '',
    this.message = '',
    required this.doctor,
    this.doctorId = '',
    required this.patient,
    this.patientId = '',
    this.status = 'PENDING',
    this.completed = false,
    this.payment_status = 'PENDING',
    List<Transactions>? transactions,
    List<Prescription>? prescription,
  }) {
    this.transactions = transactions ?? [];
    this.prescription = prescription ?? [];
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      time: json['time'] ?? '',
      charges: json['charges'] ?? 0,
      type: json['type'] ?? '',
      patient_name: json['patient_name'] ?? '',
      message: json['message'] ?? '',
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
      patient: Patient.fromJson(json['Patient']),
      patientId: json['patientId'] ?? '',
      status: json['status'] ?? 'PENDING',
      completed: json['completed'] ?? false,
      payment_status: json['payment_status'] ?? 'PENDING',
      transactions: (json['Transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e))
          .toList() ??
          [],
      prescription: (json['Prescription'] as List<dynamic>?)
          ?.map((e) => Prescription.fromJson(e))
          .toList() ??
          [],
    );
  }
  Appointment.empty()
      : id = '',
        date = DateTime.now(),
        time = '',
        charges = 0,
        type = '',
        patient_name = '',
        message = '',
        doctor = Doctor.empty(),
        doctorId = '',
        patient = Patient.empty(),
        patientId = '',
        status = 'PENDING',
        completed = false,
        payment_status = 'PENDING',
        transactions = [],
        prescription = [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'time': time,
      'charges': charges,
      'type': type,
      'patient_name': patient_name,
      'message': message,
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
      'Patient': patient.toJson(),
      'patientId': patientId,
      'status': status,
      'completed': completed,
      'payment_status': payment_status,
      'Transactions': transactions.map((e) => e.toJson()).toList(),
      'Prescription': prescription.map((e) => e.toJson()).toList(),
    };
  }
}

class Review {
  String id = '';
  int rating = 0;
  String review = '';
  DateTime date = DateTime.now();
  Doctor doctor = Doctor.empty();
  String doctorId = '';
  Patient patient = Patient.empty();
  String patientId = '';

  Review({
    this.id = '',
    this.rating = 0,
    this.review = '',
    required this.date,
    required this.doctor,
    this.doctorId = '',
    required this.patient,
    this.patientId = '',
  });

  Review.empty()
      : id = '',
        rating = 0,
        review = '',
        date = DateTime.now(),
        doctor = Doctor.empty(),
        doctorId = '',
        patient = Patient.empty(),
        patientId = '';
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      doctor: Doctor.fromJson(json['Doctor']),
      doctorId: json['doctorId'] ?? '',
      patient: Patient.fromJson(json['Patient']),
      patientId: json['patientId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'review': review,
      'date': date.toIso8601String(),
      'Doctor': doctor.toJson(),
      'doctorId': doctorId,
      'Patient': patient.toJson(),
      'patientId': patientId,
    };
  }
}

class Transactions {
  String id = '';
  int amount = 0;
  String appointment_id = '';
  String patient_id = '';
  String doctor_id = '';
  String type = 'RECEIVED';
  String status = 'PENDING';
  DateTime created_at;
  DateTime updated_at;
  Appointment appointment;
  Patient patient;
  Doctor doctor;

  Transactions({
    this.id = '',
    this.amount = 0,
    this.appointment_id = '',
    this.patient_id = '',
    this.doctor_id = '',
    this.type = 'RECEIVED',
    this.status = 'PENDING',
    required this.created_at,
    required this.updated_at,
    required this.appointment,
    required this.patient,
    required this.doctor,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'] ?? '',
      amount: json['amount'] ?? 0,
      appointment_id: json['appointment_id'] ?? '',
      patient_id: json['patient_id'] ?? '',
      doctor_id: json['doctor_id'] ?? '',
      type: json['type'] ?? 'RECEIVED',
      status: json['status'] ?? 'PENDING',
      created_at: DateTime.parse(json['created_at'] ?? ''),
      updated_at: DateTime.parse(json['updated_at'] ?? ''),
      appointment: Appointment.fromJson(json['Appointment']),
      patient: Patient.fromJson(json['Patient']),
      doctor: Doctor.fromJson(json['Doctor']),
    );
  }
  Transactions.empty()
      : id = '',
        amount = 0,
        appointment_id = '',
        patient_id = '',
        doctor_id = '',
        type = 'RECEIVED',
        status = 'PENDING',
        created_at = DateTime.now(),
        updated_at = DateTime.now(),
        appointment = Appointment.empty(),
        patient = Patient.empty(),
        doctor = Doctor.empty();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'appointment_id': appointment_id,
      'patient_id': patient_id,
      'doctor_id': doctor_id,
      'type': type,
      'status': status,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
      'Appointment': appointment.toJson(),
      'Patient': patient.toJson(),
      'Doctor': doctor.toJson(),
    };
  }
}

class Medication {
  String id = '';
  String medication = '';
  String dosage = '';
  String instructions = '';
  Prescription prescription ;
  String prescriptionId = '';

  Medication({
    this.id = '',
    this.medication = '',
    this.dosage = '',
    this.instructions = '',
    required this.prescription,
    this.prescriptionId = '',
  });

  Medication.empty()
      : id = '',
        medication = '',
        dosage = '',
        instructions = '',
        prescription = Prescription.empty(),
        prescriptionId = '';

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] ?? '',
      medication: json['medication'] ?? '',
      dosage: json['dosage'] ?? '',
      instructions: json['instructions'] ?? '',
      prescription: Prescription.fromJson(json['Prescription']),
      prescriptionId: json['prescriptionId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medication': medication,
      'dosage': dosage,
      'instructions': instructions,
      'Prescription': prescription.toJson(),
      'prescriptionId': prescriptionId,
    };
  }
}

class Prescription {
  String id = '';
  late Appointment appointment;
  String appointmentId = '';
  late List<Medication> medication;

  Prescription({
    this.id = '',
    required this.appointment,
    this.appointmentId = '',
    List<Medication>? medication,
  }) : this.medication = medication ?? [];

  Prescription.empty()
      : id = '',
        appointment = Appointment.empty(),
        appointmentId = '',
        medication = [];

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'] ?? '',
      appointment: Appointment.fromJson(json['Appointment']),
      appointmentId: json['appointmentId'] ?? '',
      medication: (json['Medication'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Appointment': appointment.toJson(),
      'appointmentId': appointmentId,
      'Medication': medication.map((e) => e.toJson()).toList(),
    };
  }
}
