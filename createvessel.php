<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';
// Check if POST data is not empty
if (!empty($_POST)) {
    

    $IMO_No =isset($_POST['IMO_No']) && !empty($_POST['IMO_No']) && $_POST['IMO_No'] != 'auto' ? $_POST['IMO_No'] : NULL;
    $A_Veracruz = isset($_POST['A_Veracruz']) ? $_POST['A_Veracruz'] : '';
    $A_Altamira = isset($_POST['A_Altamira']) ? $_POST['A_Altamira'] : '';
    $A_Miami = isset($_POST['A_Miami']) ? $_POST['A_Miami'] : '';
    $A_Charleston = isset($_POST['A_Charleston']) ? $_POST['A_Charleston'] : '';
    $A_Antwerp = isset($_POST['A_Antwerp']) ? $_POST['A_Antwerp'] : '';
    $A_LeHavre = isset($_POST['A_LeHavre']) ? $_POST['A_LeHavre'] : '';
    $A_Houston = isset($_POST['A_Houston']) ? $_POST['A_Houston'] : '';


    // Insert new record into the contacts table
    $stmt = $pdo->prepare('INSERT INTO `vessel` (`IMO_No`, `A_Veracruz`, `A_Altamira`, `A_Miami`, `A_Charleston`, `A_Antwerp`, `A_LeHavre`, `A_Houston`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
    $stmt->execute([$IMO_No, $A_Veracruz, $A_Altamira, $A_Miami, $A_Charleston, $A_Antwerp, $A_LeHavre, $A_Houston]);
    // Output message
    $msg = 'Created Successfully!';
}
?>


<?=template_header('Create')?>

<div class="content update">
	<h2>Create Contact</h2>
    <form action="createvessel.php" method="post">
    <label for="IMO_No">Vessel ID</label>
        <label for="A_Veracruz">Arrival Veracruz</label>
        <label for="A_Altamira">Arrival Altamira </label>
        <input type="text" name="IMO_No"  id="IMO_No">
        <input type="date" name="A_Veracruz"  id="A_Veracruz">
        <input type="date" name="A_Altamira"  id="A_Altamira">

        
        <label for="A_Miami">Arrival Miami </label>
        <label for="A_Charleston">Arrival Charleston </label>
        <label for="A_Miami">Arrival Miami </label>
        <input type="date" name="A_Miami"  id="A_Miami">
        <input type="date" name="A_Charleston"  id="A_Charleston">
        <input type="date" name="A_Antwerp" id="A_Antwerp">

        <label for="A_LeHavre">Arrival Miami </label>
        <label for="A_Houston">Arrival Charleston </label>
        <label for="A_Houston"> </label>
        <input type="date" name="A_LeHavre"  id="A_LeHavre">
        <input type="date" name="A_Houston"  id="A_Houston">
        <label for="A_Houston"> </label>
        <input type="submit" value="Create">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>