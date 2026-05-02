class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final String description;
  final List<String> services;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.services,
  });
}

final List<Doctor> mockDoctors = [
  Doctor(
    id: 'd1',
    name: 'Dr. Sarah Jenkins',
    specialty: 'Cardiologist',
    imageUrl: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&q=80&w=200',
    rating: 4.8,
    description: 'Expert in cardiovascular diseases with over 15 years of experience.',
    services: ['ECG', 'Heart Checkup', 'Angioplasty Consultation'],
  ),
  Doctor(
    id: 'd2',
    name: 'Dr. Michael Chen',
    specialty: 'Neurologist',
    imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&q=80&w=200',
    rating: 4.9,
    description: 'Specializes in neurological disorders and brain health.',
    services: ['Brain MRI Analysis', 'Neurological Exam'],
  ),
  Doctor(
    id: 'd3',
    name: 'Dr. Emily Watson',
    specialty: 'Pediatrician',
    imageUrl: 'https://images.unsplash.com/photo-1594824416182-35e691238691?auto=format&fit=crop&q=80&w=200',
    rating: 4.7,
    description: 'Dedicated to children\\'s health and wellness from infancy to adolescence.',
    services: ['Vaccination', 'General Checkup', 'Fever Treatment'],
  ),
];
