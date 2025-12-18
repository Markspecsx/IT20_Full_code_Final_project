// Add this method to your main.dart or create a button in the app to run it
// This will update all existing Firestore records with confidence < 85%

Future<void> updateExistingRecordsToNotIdentified() async {
  print('Starting to update existing records...');
  
  try {
    final collection = FirebaseFirestore.instance.collection('Ellazo_FootballClubs_logs');
    final snapshot = await collection.get();
    
    int totalRecords = snapshot.docs.length;
    int updatedRecords = 0;
    
    print('Found $totalRecords total records');
    
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final accuracyRate = data['Accuracy_Rate'] as num?;
      final currentClassType = data['ClassType'] as String?;
      
      // Check if accuracy is below 85% and ClassType is not already "Not Identified"
      if (accuracyRate != null && accuracyRate < 85 && currentClassType != 'Not Identified') {
        await doc.reference.update({
          'ClassType': 'Not Identified',
        });
        updatedRecords++;
        print('Updated record ${doc.id}: $currentClassType (${accuracyRate.toStringAsFixed(1)}%) -> Not Identified');
      }
    }
    
    print('\n=== Update Complete ===');
    print('Total records: $totalRecords');
    print('Updated records: $updatedRecords');
    print('Records unchanged: ${totalRecords - updatedRecords}');
    
  } catch (e) {
    print('Error updating records: $e');
  }
}

// To use this function, you can add a button in your app's UI:
// 
// ElevatedButton(
//   onPressed: () async {
//     await updateExistingRecordsToNotIdentified();
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Database update complete!')),
//     );
//   },
//   child: const Text('Update Database Records'),
// )
