<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';
// Check if the contact id exists, for example update.php?id=1 will get the contact with the id of 1
if (isset($_GET['id'])) {
    if (!empty($_POST)) {
        // This part is similar to the create.php, but instead we update a record and not insert
        $IMO_No = isset($_POST['id']) ? $_POST['id'] : NULL;
        $A_Veracruz = isset($_POST['A_Veracruz']) ? $_POST['A_Veracruz'] : '';
        $A_Altamira = isset($_POST['A_Altamira']) ? $_POST['A_Altamira'] : '';
        $A_Miami = isset($_POST['A_Miami']) ? $_POST['A_Miami'] : '';
        $A_Charleston = isset($_POST['A_Charleston']) ? $_POST['A_Charleston'] : '';
        $A_Antwerp = isset($_POST['A_Antwerp']) ? $_POST['A_Antwerp'] : '';
        $A_LeHavre = isset($_POST['A_LeHavre']) ? $_POST['A_LeHavre'] : '';
        $A_Houston = isset($_POST['A_Houston']) ? $_POST['A_Houston'] : '';


        
        // Update the record
        
        $stmt = $pdo->prepare('UPDATE vessel SET A_Veracruz = ?,A_Altamira = ?,A_Miami = ?,A_Charleston = ?,A_Antwerp = ?,A_LeHavre = ?,A_Houston = ?  WHERE IMO_No = ?');
        $stmt->execute([ $A_Veracruz ,$A_Altamira ,$A_Miami ,$A_Charleston ,$A_Antwerp ,$A_LeHavre ,$A_Houston , $_GET['id']]);
        $msg = 'Updated Successfully!';
    }
    // Get the contact from the contacts table
    $stmt = $pdo->prepare('SELECT * FROM vessel WHERE IMO_No = ?');
    $stmt->execute([$_GET['id']]);
    $contact = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contact) {
        exit('Contact doesn\'t exist with that IMO_No!');
    }
} else {
    exit('No IMO_No specified!');
}
?>



<?=template_header('Read')?>

<div class="content update">
	<h2>Update Route #<?=$contact['IMO_No']?></h2>
    <form action="updateroutes.php?id=<?=$contact['IMO_No']?>" method="post">
        <label for="IMO_No">Vessel ID</label>
        <label for="A_Veracruz">Arrival Veracruz</label>
        <label for="A_Altamira">Arrival Altamira </label>
        <input type="text" name="IMO_No" value="<?=$contact['IMO_No']?>" id="IMO_No">
        <input type="date" name="A_Veracruz" value="<?=$contact['A_Veracruz']?>" id="A_Veracruz">
        <input type="date" name="A_Altamira" value="<?=$contact['A_Altamira']?>" id="A_Altamira">

        
        <label for="A_Miami">Arrival Miami </label>
        <label for="A_Charleston">Arrival Charleston </label>
        <label for="A_Miami">Arrival Miami </label>
        <input type="date" name="A_Miami" value="<?=$contact['A_Miami']?>" id="A_Miami">
        <input type="date" name="A_Charleston" value="<?=$contact['A_Charleston']?>" id="A_Charleston">
        <input type="date" name="A_Antwerp" value="<?=$contact['A_Antwerp']?>" id="A_Antwerp">

        <label for="A_LeHavre">Arrival Miami </label>
        <label for="A_Houston">Arrival Charleston </label>
        <label for="A_Houston"> </label>
        <input type="date" name="A_LeHavre" value="<?=$contact['A_LeHavre']?>" id="A_LeHavre">
        <input type="date" name="A_Houston" value="<?=$contact['A_Houston']?>" id="A_Houston">
        <label for="A_Houston"> </label>
        

        


        
        <input type="submit" value="Update">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>